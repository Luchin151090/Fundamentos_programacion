.data 
	msg1: .asciiz "\nIngrese la cantidad de numeros: "
	msg2: .asciiz "\nIngrese un numero: "
	suma: .asciiz "\nLa suma es: "
	promedio: .asciiz "\nEl promedio es: "
	mayor: .asciiz "\nEl mayor es: "
	menor: .asciiz "\nEl menor es: "

.text
main: 	
	la $a0, msg1
	li $v0, 4
	syscall
	
	li $v0, 5
    	syscall
	move $t1, $v0

	li $t2, 0
	li $t4, 0
	li $a1, 0
	
	li.s $f1, 0.0
	li.s $f7, 0.0
	li.s $f8, 0.0
	Loop:
	  beq $t1, $t2, Exit

	  
 	  la $a0, msg2
	  li $v0, 4
	  syscall


	  li $v0, 5
	  syscall
	  move $t3,$v0
	  	
          add $t5,$t4,$t3
	  	  


bge $t3, $a1, LABEL_IF #si el primero es mayor
LABEL_ELSE:
b END_LABEL_IF
LABEL_IF:
move $a1,$t3
END_LABEL_IF:
li $v0, 1
syscall




				

	  add $t2, $t2, 1		  
	  		  
	  
	
	  j Loop		
	
 	
	Exit:


mtc1 $t5, $f4
cvt.s.w $f4, $f4
mov.s $f6,$f4


mtc1 $t5, $f4
cvt.s.w $f4, $f4
mov.s $f6,$f4

mov.s $f5,$f0
li $v0, 2
div.s $f12,$f5,$f6
syscall




mov.s $f4,$f1

la $a0, suma
li $v0, 4
syscall

mov.s $f0,$f4
li $v0, 2
syscall

la $a0,promedio
li $v0, 4
syscall

mtc1 $t1, $f12
cvt.s.w $f12, $f12
mov.s $f6,$f12



la $a0, mayor
li $v0, 4
syscall


li $v0, 1
move $a0,$t4
syscall

jr $ra
