.data
uniq_chars: .space 256

.text

## int
## nth_uniq_char(char *in_str, int n) {
##     if (!in_str || !n)
##         return -1;
##
##     uniq_chars[0] = *in_str;
##     int uniq_so_far = 1;
##     int position = 0;
##     in_str++;
##     while (uniq_so_far < n && *in_str) {
##         char is_uniq = 1;
##         for (int j = 0; j < uniq_so_far; j++) {
##             if (uniq_chars[j] == *in_str) {
##                 is_uniq = 0;
##                 break;
##             }
##         }
##         if (is_uniq) {
##             uniq_chars[uniq_so_far] = *in_str;
##             uniq_so_far++;
##         }
##         position++;
##         in_str++;
##     }
##
##     if (uniq_so_far < n) {
##         position++;
##     }
##     return position;
## }

.globl nth_uniq_char
nth_uniq_char:
	lb $t0, 0($a0)     ## in_str
	beq $t0, 0, return;
	beq $a1, 0, return;

	la $a2,uniq_chars;
	sb $t0, 0($a2);
	li $t1, 1; ## uniq so far
	li $t2,0 ; ## position
	addi $a0 , $a0, 1;


	while:

		bge $t1, $a1, return2 ## uniq so far<n ?
		lb $t3, 0($a0) ## new in _str
		beq $t3,0,return2

		li $t4 ,1 ## is_unique
		li $t5,0 ## j

		loop:
		  bge $t5, $t1 , endloop;
			add $a2, $a2, $t5; ## uniq char[j]
			lb   $t6, 0($a2) ## [j]
			beq  $t6,$t3, repeat ## if repeat
			sub $a2, $a2, $t5
			addi $t5, $t5,1
			jr loop


		endloop:
			bne $t4,0,writein




   endwhile:
	  addi $t2, $t2 ,1
	  addi $a0, $a0, 1
	  jr while

return2:
	blt $t1, $a1, wtf
final:
	move $v0, $t2
	jr $ra


return:
		li $t8, -1;
		move $v0,$t8;
		jr $ra

repeat:
  sub $a2, $a2, $t5
	li $t7,1;
	sub $t4, $t4,$t7
	jr endloop

writein:
	add $a2,$a2,$t1;
	sb $t3, 0($a2);
	sub $a2,$a2,$t1
	addi $t1, $t1, 1
  jr endwhile;

wtf:
	addi $t2, $t2, 1;
	jr final;
