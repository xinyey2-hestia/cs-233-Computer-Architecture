# syscall constants
PRINT_STRING	= 4
PRINT_CHAR	= 11
PRINT_INT	= 1

# memory-mapped I/O
VELOCITY	= 0xffff0010
ANGLE		= 0xffff0014
ANGLE_CONTROL	= 0xffff0018

BOT_X		= 0xffff0020
BOT_Y		= 0xffff0024

TIMER		= 0xffff001c

REQUEST_JETSTREAM	= 0xffff00dc
REQUEST_STARCOIN	= 0xffff00e0

PRINT_INT_ADDR		= 0xffff0080
PRINT_FLOAT_ADDR	= 0xffff0084
PRINT_HEX_ADDR		= 0xffff0088

# interrupt constants
BONK_MASK	= 0x1000
BONK_ACK	= 0xffff0060

TIMER_MASK	= 0x8000
TIMER_ACK	= 0xffff006c

REQUEST_STARCOIN_INT_MASK	= 0x4000
REQUEST_STARCOIN_ACK		= 0xffff00e4

.data
# put your data things here

.align 2
event_horizon_data: .space 32




.text
main:
	
	la   $t0, event_horizon_data
	sw	 $t0, REQUEST_JETSTREAM      #t0 is the map
	li $t4,10	
	sw $t4,VELOCITY
	li $t1, 300
	sw $t1,ANGLE
	li $t2,1
	sw $t2,ANGLE_CONTROL
	li $t8, 120
	j Ycoor

Ycoor:
	la $t0, event_horizon_data
	sw $t0, REQUEST_JETSTREAM
	
	#lb $t1,4($t0)                     
	lw $t3,BOT_Y                       # get y
	li $t4,300
    mul $t3,$t3,$t4
	lw $t5, BOT_X                      # cur x
	add $t3,$t3,$t5
	add $t0, $t0,$t3                #fin
	lb $t1,0($t0)					#0,1,2?
	li $t2,1
	li $t6,2
	li $t7,0
	beq $t1,$t6,Ycoor
	beq $t1,$t2,backward
	
backward:
	beq $t7,$t8,Inward
	li $t2,-10
	sw $t2,VELOCITY
	add $t7,$t7,1
	j movet

movet:
	la $t0, event_horizon_data
	sw $t0, REQUEST_JETSTREAM
	
	#lb $t1,4($t0)                     
	lw $t3,BOT_Y                       # get y
	li $t4,300
    mul $t3,$t3,$t4
	lw $t5, BOT_X                      # cur x
	add $t3,$t3,$t5
	add $t0, $t0,$t3                #fin
	j backward

Inward:
	li $t5,29
	sw $t5,0xffff0014($zero)
	li $t3,0
	sw $t3,0xffff0018($zero)
	li $t4,10	
	sw $t4,VELOCITY
	j Ycoor







 
	# note that we infinite loop to avoid stopping the simulation early
	j	main
