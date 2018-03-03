# before running your code for the first time, run:
#     module load QtSpim
# run with:
#     QtSpim -file main.s question_4.s

# void reverse_array_range(int *array, int start, int end) {
#     int length = end - start;
#     if (length > 0) {
#         for (int i = 0; i < length / 2; i++) {
#             int temp = array[start + i];
#             array[start + i] = array[end - i - 1];
#             array[end - i - 1] = temp;
#         }
#     }
# }
.globl reverse_array_range
reverse_array_range:

sub $t0, $a2, $a1    #length

ble $t0, 0, end
li $t1,0    #i
li $t9,2
div $t2, $t0, $t9 #length/2
loop:
	bge $t1, $t2, end
	add $t3, $a1, $t1   #start+i
	add $t4, $t3, $a0    #arr
	lw   $t5, 0($t4)    #temp
	sub $t6, $a2,$t1
	sub $t6, $t6,1    #end-i-1
	add $t7, $t6, $a0
	lw  $t8, 0($t7) #arr end-i-1
	sw $t8, 0($t3)
	sw $t5,0($t6)
	
	addi $t1,$t1, 1
	j loop





end:
  jr $ra
