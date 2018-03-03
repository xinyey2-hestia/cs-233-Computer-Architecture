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

sector_info: .space 256
star_info: .space 32

# whether the scan has finished or not
scan_flag:
		.space 4



.text
main:
	li $t9,0

eat:
	li $t4,REQUEST_STARCOIN_INT_MASK
	or $t4,$t4,BONK_MASK
	or $t4,$t4,1         #interrupt enable
	
	mtc0 $t4,$12  
	sw $0,scan_flag   
	
	li $t8,0
	sw $t8,VELOCITY
	#addi $t9, $t9,1
	li $t8,4
	beq $t9,$t8,cyclex

start_scan:
	la $t0,sector_info
	sw $t0,REQUEST_STARCOIN      #the map of star dust
	

wait_scan:
	lw  $t5, scan_flag
	beq $t5, 1, xcoor
	j wait_scan


xcoor:
	li $t8,10
	sw $t8,VELOCITY
	#la $t0,sector_info
	#sw $t0,REQUEST_STARCOIN
	lw $t3,BOT_X          #get botx
	lw $t1, 0($t0)        #get the first coin x-coor
	beq $t1,0xffffffff, run
	
	srl $t1,$t1,16
	beq $t1,$t3,ycoor
	bgt $t1,$t3,right    # move to east

	li $t6,180
	sw $t6,ANGLE
	li $t2,1
	sw $t2,ANGLE_CONTROL
	j xcoor
run:
	li $t5,10000
	li $t6,0
	li $t7,5
	sw $t7,ANGLE
	li $t8,0
	sw $t8,ANGLE_CONTROL
	j runloop
runloop:
	bgt $t6,$t5,eat

	addi $t6,$t6,1
	j runloop


right:
	li $t6,0
	sw $t6,ANGLE
	li $t2,1
	sw $t2,ANGLE_CONTROL
	j xcoor

ycoor:
	#la $t0,sector_info
	#sw $t0,REQUEST_STARCOIN
	lw $t1,0($t0)
	li $t5,65535
	and $t1,$t1,$t5
	lw $t3,BOT_Y
	beq $t3,$t1,temp
	bgt $t1,$t3,down
	
	li $t6, 270
	sw $t6,ANGLE
	li $t2,1
	sw $t2,ANGLE_CONTROL
	j ycoor
temp:
	add $t9,$t9,1
	j eat
down:
	li $t6,90
	sw $t6,ANGLE
	li $t2,1
	sw $t2,ANGLE_CONTROL
	j ycoor


cyclex:
	li $t8,10
	sw $t8,VELOCITY
	li $t1, 109 #x
	li $t2, 109 #y
	lw $t3,BOT_X          #get botx

	beq $t1,$t3,cycley
	bgt $t1,$t3,cycler    # move to east

	li $t6,180
	sw $t6,ANGLE
	li $t4,1
	sw $t4,ANGLE_CONTROL
	j cyclex

cycley:
	li $t8,10
	sw $t8,VELOCITY
	lw $t9,BOT_X
	bne $t9,$t1,cyclex
	lw $t3,BOT_Y
	beq $t3,$t2,runc
	bgt $t2,$t3,cycled
	li $t6, 270
	sw $t6,ANGLE
	li $t4,1
	sw $t4,ANGLE_CONTROL
	j cycley
	
cycler:
	li $t8,10
	sw $t8,VELOCITY
	li $t6,0
	sw $t6,ANGLE
	li $t4,1
	sw $t4,ANGLE_CONTROL
	j cyclex
cycled:
	li $t8,10
	sw $t8,VELOCITY
	li $t6,90
	sw $t6,ANGLE
	li $t4,1
	sw $t4,ANGLE_CONTROL
	j cycley

runc:
	li $t8,0
	sw $t8,VELOCITY
	li $t4,0
	sw $t4,ANGLE
	li $t8,10
	sw $t8,VELOCITY
	li $t5,1
	sw $t5,ANGLE_CONTROL
	li $t7,0
	li $t8,109328
	j runloop2

runloop2:
	li $t3,10
	sw $t3,VELOCITY
	beq $t7,$t8,setup
	add $t7,$t7,1
	j runloop2

setup:
	li $t3,10
	sw $t3,VELOCITY
	li $t6,90
	sw $t6,ANGLE
	li $t4,0
	sw $t4,ANGLE_CONTROL
	li $t7,0
	j runloop2
infinite:
	j  infinite

.kdata
chunkIH:.space 8 # 2 registers?
non_intrpt_str: .asciiz "Non-interrupt exception\n"
unhandled_str: .asciiz "Unhandled interrupt type\n"

.ktext  0x80000180
interrupt_handler:
.set noat
	move $k1,$at
.set at
	la 	$k0, chunkIH
	sw 	$a0, 0($k0) 		# Get some free registers
	sw 	$a1, 4($k0) 		# by storing them to a global variable
	mfc0 	$k0, $13 		# Get Cause register
	srl 	$a0, $k0, 2	
	and 	$a0, $a0, 0xf		# ExcCode field
	bne 	$a0, 0, non_intrpt


interrupt_dispatch:
	mfc0 $k0, $13
	beq $k0, $zero, done   #handle all
	and $a0, $k0, 0x4000   # is there a scan interrupt?
	bne $a0, 0, scan_interrupt

	and $a0,$k0,0x1000
	bne $a0,0, bonk_interupt

	li $v0,4
	la $a0, unhandled_str
	syscall
	j done

bonk_interupt:
	li $t6,0
	sw $t6,ANGLE
	li $t2,0
	sw $t2,ANGLE_CONTROL
	sw $a1, BONK_ACK
	j interrupt_dispatch

scan_interrupt:
	la $t7,scan_flag
	li $t8,1
	sw $t8,0($t7)
	sw $a1, REQUEST_STARCOIN_ACK
	j interrupt_dispatch
	
non_intrpt:
	li $v0,4
	la $a0,non_intrpt_str
	syscall
	j done

done:
	la $k0, chunkIH
	lw $a0, 0($k0)
	lw $a1, 4($k0)
.set noat
	move $at, $k1
.set at
	eret






	
