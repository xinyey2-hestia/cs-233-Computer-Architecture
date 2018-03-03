.data

.text

## struct Node {
##     int node_id;            // Unique node ID
##     struct Node **children; // pointer to null terminated array of children node pointers
## };
##
## int
## max_depth(Node *current) {
##     if (current == NULL)
##         return 0;
## 
##     int cur_child = 0;
##     Node *child = current->children[cur_child];
##     int max = 0;
##     while (child != NULL) {
##         int depth = max_depth(child);
##         if (depth > max)
##             max = depth;
##         cur_child++;
##         child = current->children[cur_child];
##     }
##     return 1 + max;
## }

.globl max_depth
max_depth:
	# Your code goes here :)
	sub $sp, $sp, 28
	sw $ra, 0($sp)
	sw $s0, 4($sp)  #current
	sw $s1, 8($sp)  # cur_child
	sw $s2, 12($sp) #child
	sw $s3, 16($sp) #max
	sw $s4, 20($sp) # depth
	sw $s5, 24($sp) # cur->children
	
	move $s0, $a0
	
	beq $s0, $0, return0
	li $s1, 0  ##cur_child
	lw $s5,4($s0) ##children
	sll $t2, $s1 , 2
	add $s5, $s5, $t2
	lw $s2 , 0($s5) ## child
	li $s3, 0 ##max
	
while:
	beq $s2, $0 , endwhile
	move $a0, $s2
	jal max_depth
	move $s4, $v0  ## depth
	ble $s4,$s3, continue
	move $s3, $s4
continue:
	add $s1, $s1 , 1
	sll $t1,$s1,2
	add $s2, $s5,$t1

	lw $s2 , 0($s2) ## child
	j while


endwhile:
	addi $s3,$s3, 1;
	move $v0, $s3
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)  #current
	lw $s1, 8($sp)  # cur_child
	lw $s2, 12($sp) #child
	lw $s3, 16($sp) #max
	lw $s4, 20($sp) # depth
	lw $s5, 24($sp) # cur->children
	add $sp, $sp ,28
	
	jr	$ra

return0:
	li $v0, 0;

	lw $ra, 0($sp)
	lw $s0, 4($sp)  #current
	lw $s1, 8($sp)  # cur_child
	lw $s2, 12($sp) #child
	lw $s3, 16($sp) #max
	lw $s4, 20($sp) # depth
	lw $s5, 24($sp) # cur->children
	add $sp, $sp ,28
	jr $ra
