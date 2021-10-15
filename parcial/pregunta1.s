.data

msg3: .asciiz "\n"
msg4: .asciiz "\n"
msg5: .asciiz "\n"
endline: .asciiz "\n"
.text

.globl main

main:

    li $t1, 2
    li $t2, 30


    move $a0, $t1
    li $v0,1 
    syscall

    li $v0, 4
    la $a0, endline
    syscall


    bne $t1, $t2, continue1
    li $v0, 4
    la $a0, msg4
    syscall
    j exit


    continue1:

    blt $t1,$t2, continue2
    li $v0, 4
    la $a0, msg3
    syscall

    move $t4, $t1
    move $t1, $t2
    move $t2, $t4

    continue2:

    bgt $zero,$t1, negRange
    j continue3

    negRange:
        li $v0, 4
        la $a0, msg5
        syscall

        j exit

    continue3:
    addi $t1, $t1, 1


    beq $t1, $t2, noRange
    j loop
    noRange:
        li $v0, 4
        la $a0, msg4
        syscall
        j exit

    loop:

        move $a0, $t1
        jal checkPrime

        move $t8, $v0
        beq $t8, $zero, continue

        li $v0, 1
        move $a0, $t1
        syscall
        li $v0, 4
        la $a0, endline
        syscall
    continue:

        addi $t1, $t1, 1

        beq $t1, $t2, end_loop
        j loop
    end_loop:
exit:
    li $v0, 10
    syscall 



checkPrime:
    li $t0, 2

    li $t6, 1
    beq $a0, $t6, not_prime 
    loopCheck:
        rem $t3, $a0, $t0
        beq $t3, $zero, not_prime
        addi $t0, $t0, 1
        beq $t0, $a0, end_loop_yes
        j loopCheck

    not_prime:
        li $v0, 0
        jr $ra
    end_loop_yes:
        li $v0, 1
        jr $ra
