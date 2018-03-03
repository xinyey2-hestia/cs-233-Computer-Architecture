.text

## unsigned int
## my_strlen(char *in) {
##     if (!in)
##         return 0;
##
##     unsigned int count = 0;
##     while (*in) {
##         count++;
##         in++;
##     }
##
##     return count;
## }

.globl my_strlen
my_strlen:
	# Your code goes here :)
	li $t0, 0;
loop:
  lb $t1,0($a0);
	bne $t1,$0,while;  ## determine if the input has length 0
	move $v0, $t0;
	jr	$ra;

while:
	addi $t0, $t0,1;
	addi $a0, $a0,1;
	j loop;
