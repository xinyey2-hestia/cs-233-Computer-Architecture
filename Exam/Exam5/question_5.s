# before running your code for the first time, run:
#     module load QtSpim
# run with:
#     QtSpim -file main.s question_5.s

# struct node_t {
#     node_t *left;
#     node_t *right;
#     int *data;
# };
# 
# void initialize(node_t *root, int value) {
#     if (root == NULL) {
#         return;
#     }
# 
#     if (root->data != NULL) {
#         *(root->data) = value;
#     }
# 
#     if (root->left != NULL) {
#         initialize(root->left, value);
#     }
# 
#     if (root->right != NULL) {
#         initialize(root->right, value);
#     }
# }
.globl initialize
initialize:
	sub $sp, $sp, 12
	sw $ra, 0($sp)
	sw $s0,	4($sp)  #for root
	sw $s1, 8($sp)	#for value
	
	move $s0, $a0
	move $s1, $a1

	beq $s0, $0, returnend
	
	lw $t1, 8($a0)
	beq $t1, $0, endif1
	sw $a1, 0($t1)  #  or 8($s0) ?

endif1:
	lw $t2, 0($s0) #left
	lw $t3,	4($s0) # right
	bne $t2, $0, leftrec
	bne $t3, $0, rightrec

	lw $ra, 0($sp)
	lw $s0,	4($sp)  #for root
	lw $s1, 8($sp)	#for value
	add $sp, $sp, 12
	jr $ra


leftrec:
	move $a0, $t2
	move $a1, $s1
	jal initialize

rightrec:
	move $a0, $t3
	move $a1, $s1
	jal initialize

returnend:
	lw $ra, 0($sp)
	lw $s0,	4($sp)  #for root
	lw $s1, 8($sp)	#for value
	add $sp, $sp, 12
	jr $ra





