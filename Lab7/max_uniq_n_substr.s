.text

## void
## max_unique_n_substr(char *in_str, char *out_str, int n) {
##     if (!in_str || !out_str || !n)
##         return;
##
##     char *max_marker = in_str;
##     unsigned int len_max = 0;
##     unsigned int len_in_str = my_strlen(in_str);
##     for (unsigned int cur_pos = 0; cur_pos < len_in_str; cur_pos++) {
##         char *i = in_str + cur_pos;
##         int len_cur = nth_uniq_char(i, n + 1);
##         if (len_cur > len_max) {
##             len_max = len_cur;
##             max_marker = i;
##         }
##     }
##
##     my_strncpy(out_str, max_marker, len_max);
## }

.globl max_unique_n_substr
max_unique_n_substr:

sub 		$sp, $sp, 36	##preserve stack pointer for later use
		sw 		$ra, 0($sp)  	##preserve for ra (return)
		sw 		$s0, 4($sp)  	##preserve for $a0  in_str
		sw 		$s1, 8($sp)  	##preserve for $a1  out_str
		sw 		$s2, 12($sp) 	##preserve for $a2  n
		sw 		$s3, 16($sp) 	##preserve for max_maker
		sw 		$s4, 20($sp) 	##preserve for len_in_str
		sw 		$s5, 24($sp)    ##preserve for cur_pos
		sw    $s6, 28 ($sp)  ## i
		sw   $s7, 32($sp)    ##len _max


		li $s5, 0;
		li $s7, 0;
		move $s1, $a1
		move $s2, $a2
		move $s0, $a0
		move $s3, $a0



	beq $a0,$0,return
	beq $a1,$0,return
	beq $a2,$0, return

     move $a0, $s0
	jal my_strlen
	move $s4,$v0 ##len_in_str


	loop:
	bge $s5,$s4,endloop;

	add $s6,$s0, $s5     ## parameter i
	move $a0, $s6
	addi $t2, $s2,1      ##n+1
	move $a1, $t2

	jal nth_uniq_char
	move $t1, $v0   ##len_cur
	bgt $t1,$s7,sth

	continue:
	add $s5,$s5,1
	jr loop

	endloop:
	move $a0, $s1
	move $a1,$s3
	move $a2, $s7
	jal  my_strncpy


	lw 		$ra, 0($sp)  	##preserve for ra (return)
	lw 		$s0, 4($sp)  	##preserve for $a0  in_str
	lw 		$s1, 8($sp)  	##preserve for $a1  out_str
	lw 		$s2, 12($sp) 	##preserve for $a2  n
	lw 		$s3, 16($sp) 	##preserve for max_maker
	lw 		$s4, 20($sp) 	##preserve for len_in_str
	lw 		$s5, 24($sp)    ##preserve for cur_pos
	lw    $s6, 28 ($sp)  ## len_cur
	lw   $s7, 32($sp)    ##len _max
	add		$sp, $sp, 36


	jr	$ra

	sth:
		move $s7,$t1
		move $s3,$s6
		jr continue

	return:
	lw 		$ra, 0($sp)  	##preserve for ra (return)
	lw 		$s0, 4($sp)  	##preserve for $a0  in_str
	lw 		$s1, 8($sp)  	##preserve for $a1  out_str
	lw 		$s2, 12($sp) 	##preserve for $a2  n
	lw 		$s3, 16($sp) 	##preserve for max_maker
	lw 		$s4, 20($sp) 	##preserve for len_in_str
	lw 		$s5, 24($sp)    ##preserve for cur_pos
	lw    $s6, 28 ($sp)  ## len_cur
	lw   $s7, 32($sp)    ##len _max
	add		$sp, $sp, 36
	jr $ra
