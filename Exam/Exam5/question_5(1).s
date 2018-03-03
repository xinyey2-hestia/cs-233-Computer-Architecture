# before running your code for the first time, run:
#     module load QtSpim
# run with:
#     QtSpim -file main.s question_5.s

# struct node_t {
#     node_t *children[4];
#     int data;
# };
# 
# int quad_averageup(node_t *root) {
#     if (root == NULL) {
#         return 0;
#     }
# 
#     if (root->children[0] != NULL) {
#         int total = 0;
#         for (int i = 0; i < 4; i++) {
#             total += quad_averageup(root->children[i]);
#         }
#         root->data = total >> 2;
#     }
# 
#     return root->data;
# }
.globl quad_averageup
quad_averageup:
sub $sp,$sp,28
sw $ra,0($sp)
sw $s0,4($sp)   #root
sw $s1,8($sp)	#total
sw $s2,12($sp)	#i
sw $s3,16($sp)  #root->children[i]
sw $s4,20($sp)	# root->data
sw $s5,24($sp)
move $s0,$a0
li $s2,0
beq $a0,0,exit
lw $s4,16($s0)
lw $s5, 0($s0)	#root->children[0]
li $s1,0
beq $s5,0,return1
while:
	bge $s2,4,endloop
	mul $t1,$s2,4
	add $s3,$s0,$t1
	lw $a0,0($s3)
	jal quad_averageup
	add $s1,$s1,$v0
	add $s2,$s2,1
	j while
endloop:
	srl $s4,$s1,2
	sw $s4, 16($a0)
	
return1:
	move $v0,$s4
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	lw $s3,16($sp)
	lw $s4,20($sp)
	lw $s5,24($sp)
	add $sp,$sp,28
	jr $ra

exit:
	move $v0,$0
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	lw $s3,16($sp)
	lw $s4,20($sp)
	lw $s5,24($sp)
	add $sp,$sp,28
	jr $ra
	
