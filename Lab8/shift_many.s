## struct Shifter {
##     unsigned int value;
##     unsigned int *to_rotate[4];
## };
##
##
## void
## shift_many(Shifter *s, int offset) {
##     for (int i = 0; i < 4; i++) {
##         unsigned int *ptr = s->to_rotate[i];
##
##         if (ptr == NULL) {
##             continue;
##         }
##
##         unsigned char x = (i + offset) & 3;
##         *ptr = circular_shift(s->value, x);
##     }
## }

shift_many:
	# Your code goes here :)
	sub $sp, $sp, 36
	sw $ra, 0($sp)
	sw $s6, 4($sp) 
	sw $s0, 8($sp) 
	sw $s2, 12($sp) 
	sw $s1, 16($sp) 
	sw $s4, 20($sp) 
	sw $s5, 24($sp) 
	sw $s3, 28($sp)
	sw $s7, 32($sp) 
	move $s6,$a0 #s
	move $s0,$a1 
	add $s1, $s6,4
	li $s7,0
loop:
	bge $s7,4, end1
	mul $t0,$s7,4
	add $s5,$s1,$t0 #rotate[i];
	lw  $s4,0($s5) #ptr
	beq $s4,$0,endloop
	add $t1,$s0,$s7
	li $t2,3
	lw $a0,0($s6)
	and $a1,$t1,$t2
	jal circular_shift
	sw $v0,0($s4)

endloop:
	add $s7,$s7,1
	j loop
end1:
	move $a0,$s6
	move $a1,$s0
	lw $ra, 0($sp)
	lw $s6, 4($sp) 
	lw $s0, 8($sp)
	lw $s2, 12($sp)
	lw $s1, 16($sp) 
	lw $s4, 20($sp) 
	lw $s5, 24($sp) 
	lw $s3, 28($sp)
	lw $s7, 32($sp) 
	add $sp,$sp,36
	jr $ra
