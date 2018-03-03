.data

.text

## void
## decrypt(unsigned char *ciphertext, unsigned char *plaintext, unsigned char *key,
##         unsigned char rounds) {
##     unsigned char A[16], B[16], C[16], D[16];
##     key_addition(ciphertext, &key[16 * rounds], C);
##     inv_shift_rows(C, (unsigned int *) B);
##     inv_byte_substitution(B, A);
##     for (unsigned int k = rounds - 1; k > 0; k--) {
##         key_addition(A, &key[16 * k], D);
##         inv_mix_column(D, C);
##         inv_shift_rows(C, (unsigned int *) B);
##         inv_byte_substitution(B, A);
##     }
##     key_addition(A, key, plaintext);
##     return;
## }

.globl decrypt
decrypt:
	sub  $sp, $sp,16 ##A
    move $s4, $sp
    sub  $sp, $sp,16## B
	move $s5, $sp
    sub  $sp, $sp,16 ##c
    move $s6, $sp
	sub  $sp, $sp,16 ##d
    move $s7, $sp

	sub   $sp, $sp, 20
	sw    $ra,0($sp)
    sw	  $s0,4($sp) ##store a0
	sw	  $s1,8($sp)  ##store a1
	sw	  $s2,12($sp)  ## store a2 key
	sw	  $s3,16($sp)  ## a3 round
	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	move $s3, $a3

	li $t4,16;
	mul $t4, $t4,$s3
	move $a2, $s2
	add $a2, $a2, $t4
	move $a1, $a2 ## key[16*xx]
	move $a0, $s0
	move $a2, $s6 ##c
	jal key_addition

	move $a0,$s6       ## maybe wrong (unsigned int? how to cast)
	move $a1, $s5
	jal inv_shift_rows

	move $a0, $s5
	move $a1, $s4
	jal inv_byte_substitution



	li $t3 , 1
	sub $s3, $s3,$t3 ##K

loop:
	ble $s3, 0 , endloop
	move $a0 , $s4  ##A
	li $t6, 16
	mul $t6, $s3, $t6 ##16*k
	add $t6, $t6, $s2
	move $a1, $t6
	move $a2, $s7
	jal key_addition
	move $a0, $s7
	move $a1, $s6
	jal inv_mix_column
	move $a0, $s6
	move $a1, $s5
	jal inv_shift_rows
	move $a0, $s5
	move $a1, $s4
	jal inv_byte_substitution

	sub $s3, $s3,1
	jr loop

endloop:
	move $a0, $s4
	move $a1, $s2
	move $a2, $s1
	jal key_addition

	lw    $ra,0($sp)
    lw	  $s0,4($sp) ##store a0
	lw	  $s1,8($sp)  ##store a1
	lw	  $s2,12($sp)  ## store a2 key
	lw	  $s3,16($sp)  ## a3 round
	add   $sp, $sp, 20
    add   $sp, $sp, 64



	jr $ra
