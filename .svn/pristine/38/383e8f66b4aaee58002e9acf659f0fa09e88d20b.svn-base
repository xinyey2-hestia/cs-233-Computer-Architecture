.text

## unsigned int
## circular_shift(unsigned int in, unsigned char s) {
##     return (in >> 8 * s) | (in << (32 - 8 * s));
## }

.globl circular_shift
circular_shift:
	# Your code goes here :)
  mul $t0,$a1,8;
	srl $t1,$a0,$t0; ## shift right
	li $t5, 32;
	sub $t2, $t5, $t0; ## shift left bits

	sll $t3, $a0,$t2; ## shift left

	or $t4, $t1, $t3;
	move $v0, $t4;

	jr	$ra
