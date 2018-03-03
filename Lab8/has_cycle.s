.data

.text
## struct Node {
##     int node_id;            // Unique node ID
##     struct Node **children; // pointer to null terminated array of children node pointers
## };
##
## int
## has_cycle(Node *root, int num_nodes) {
##     if (!root)
##         return 0;
##
##     Node *stack[num_nodes];
##     stack[0] = root;
##     int stack_size = 1;
##
##     int discovered[num_nodes];
##     for (int i = 0; i < num_nodes; i++) {
##         discovered[i] = 0;
##     }
##
##     while (stack_size > 0) {
##         Node *node_ptr = stack[--stack_size];
##
##         if (discovered[node_ptr->node_id]) {
##             return 1;
##         }
##         discovered[node_ptr->node_id] = 1;
##
##         for (Node **edge_ptr = node_ptr->children; *edge_ptr; edge_ptr++) {
##             stack[stack_size++] = *edge_ptr;
##         }
##     }
##
##     return 0;
## }

.globl has_cycle
has_cycle:



	sll $t0, $a1, 3    ##stack
	sub $sp, $sp, $t0
	beq $a0, $0, end0
	move $t0, $sp
	sll $t1, $a1, 2  ## discover
	add $t1, $sp, $t1
	sw $a0,0($t0)

	li $t5 ,1 ##size
	li $t8, 0 ## i

loop:
	bge $t8, $a1, while
	sll $t4,$t8,2  ## t2 *4
	add $t4, $t1, $t4
	sw $0 , 0($t4)
	addi $t8, $t8,1
	j loop

while:li $v0, 0
	ble $t5, 0 , whileend
	sub $t5, $t5,1
	sll $t8, $t5,2
	add $t8, $t8, $t0
	lw $t8, 0($t8) ##ptr
	lw $t4 , 0($t8) ##node id
	sll $t3, $t4 , 2  ##id *4
	add $t3, $t3, $t1
	lw $t6 , 0($t3)   ##true false
	beq $t6 , 1 , end1;
	li $t9,1
	sw $t9,0($t3)
	lw $t6,4($t8)
	li $t7,0

forloop:
	sll $t3, $t7,2  ##
	add $t3, $t3, $t6
	lw $t3, 0($t3)
	beq $t3, $0, while
	sll $t9, $t5,2
	add $t9, $t0, $t9
	sw $t3, 0($t9)
	addi $t5, $t5, 1
	addi $t7, $t7,1
	j forloop








end1:
	li $v0,1
	sll $t0, $a1 , 3
	add $sp, $sp , $t0
	jr $ra


whileend:
	sll $t0, $a1 , 3
	add $sp, $sp , $t0
	jr $ra



end0:
li $v0 , 0
sll $t0, $a1 , 3
add $sp, $sp , $t0
	jr $ra
