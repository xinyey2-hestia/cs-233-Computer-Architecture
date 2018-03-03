.text

## void
## key_addition(unsigned char *in_one, unsigned char *in_two, unsigned char *out) {
##     for (unsigned int i = 0; i < 16; i++) {
##         out[i] = in_one[i] ^ in_two[i];
##     }
## }

.globl key_addition
key_addition:
li $t0, 0;
li $t4,16;
loop:
	lb $t1, 0($a0); ## in one [i]
	lb $t2, 0($a1); ## in two[i]
	xor $t3, $t1,$t2;
	sb $t3, 0($a2);
	addi $a0, $a0,1;
	addi $a1, $a1,1;
	addi $t0, $t0,1;
	addi $a2, $a2,1;
    blt $t0, $t4, loop;
	
	jr	$ra
