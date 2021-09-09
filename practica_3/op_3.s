.data 
	lado1: .asciiz "\nIngrese el primer lado del triangulo: "
	lado2: .asciiz "\nIngrese el segundo lado del triangulo: "
	lado3: .asciiz "\nIngrese el tercer lado del triangulo: "
	valido: .asciiz "\nEl triangulo es valido"	
	invalido: .asciiz "\nEl triangulo no es valido"
.text
main:
la $a0, lado1
li $v0, 4
syscall	

li $v0, 5
syscall
move $t1,$v0



la $a0,lado2
li $v0, 4}
syscall

li $v0, 5
syscall
move $t2,$v0



la $a0, lado3
li $v0, 4
syscall

li $v0, 5
syscall
move $t3,$v0


add $a0, $t1, $t2
li $v0, 1
syscall
move $t4, $a0

add $a0,$t2,$t3
li $v0,1
syscall
move $t5, $a0

add $a0,$t1,$t3
li $v0,1
syscall
move $t6, $a0


bge $t4, $t3, LABEL_IF #si el primero es mayor
LABEL_ELSE:
la $a0, invalido
b END_LABEL_IF
LABEL_IF:
bge $t5, $t1, LABEL_SI 

LABEL_SINO:
la $a0, invalido
b END_LABEL_IF

LABEL_SI:
bge $t6,$t2,LABEL_SII

LABEL_FALLA:
la $a0, invalido
b END_LABEL_IF

LABEL_SII:
la $a0, valido

#la $a0, valido 
END_LABEL_IF:
li $v0, 4
syscall



jr $ra
