# syscall constants
PRINT_STRING = 4
PRINT_CHAR   = 11
PRINT_INT    = 1

# debug constants
PRINT_INT_ADDR   = 0xffff0080
PRINT_FLOAT_ADDR = 0xffff0084
PRINT_HEX_ADDR   = 0xffff0088

# spimbot memory-mapped I/O
VELOCITY       = 0xffff0010
ANGLE          = 0xffff0014
ANGLE_CONTROL  = 0xffff0018
BOT_X          = 0xffff0020
BOT_Y          = 0xffff0024
OTHER_BOT_X    = 0xffff00a0
OTHER_BOT_Y    = 0xffff00a4
TIMER          = 0xffff001c
SCORES_REQUEST = 0xffff1018

REQUEST_JETSTREAM	= 0xffff00dc
REQUEST_RADAR		= 0xffff00e0
BANANA			= 0xffff0040
MUSHROOM		= 0xffff0044
STARCOIN		= 0xffff0048

REQUEST_PUZZLE		= 0xffff00d0
SUBMIT_SOLUTION		= 0xffff00d4

# interrupt constants
BONK_MASK	= 0x1000
BONK_ACK	= 0xffff0060

TIMER_MASK	= 0x8000
TIMER_ACK	= 0xffff006c

REQUEST_RADAR_INT_MASK	= 0x4000
REQUEST_RADAR_ACK	= 0xffff00e4

REQUEST_PUZZLE_ACK	= 0xffff00d8
REQUEST_PUZZLE_INT_MASK	= 0x800

.data
# put your data things here

.align 2
event_horizon_data: .space 32

sector_info: .space 256
star_info: .space 32

# whether the scan has finished or not
scan_flag:
		.space 4

puzzle_data: .space 1000
puzzle_data_2: .space 1000
puzzle_data_3: .space 1000
uniq_chars: .space 256
starcoin_count: .space 4
start_part_2: .space 4
inv_sbox:
.byte 0x52 0x09 0x6A 0xD5 0x30 0x36 0xA5 0x38 0xBF 0x40 0xA3 0x9E 0x81 0xF3 0xD7 0xFB
.byte 0x7C 0xE3 0x39 0x82 0x9B 0x2F 0xFF 0x87 0x34 0x8E 0x43 0x44 0xC4 0xDE 0xE9 0xCB
.byte 0x54 0x7B 0x94 0x32 0xA6 0xC2 0x23 0x3D 0xEE 0x4C 0x95 0x0B 0x42 0xFA 0xC3 0x4E
.byte 0x08 0x2E 0xA1 0x66 0x28 0xD9 0x24 0xB2 0x76 0x5B 0xA2 0x49 0x6D 0x8B 0xD1 0x25
.byte 0x72 0xF8 0xF6 0x64 0x86 0x68 0x98 0x16 0xD4 0xA4 0x5C 0xCC 0x5D 0x65 0xB6 0x92
.byte 0x6C 0x70 0x48 0x50 0xFD 0xED 0xB9 0xDA 0x5E 0x15 0x46 0x57 0xA7 0x8D 0x9D 0x84
.byte 0x90 0xD8 0xAB 0x00 0x8C 0xBC 0xD3 0x0A 0xF7 0xE4 0x58 0x05 0xB8 0xB3 0x45 0x06
.byte 0xD0 0x2C 0x1E 0x8F 0xCA 0x3F 0x0F 0x02 0xC1 0xAF 0xBD 0x03 0x01 0x13 0x8A 0x6B
.byte 0x3A 0x91 0x11 0x41 0x4F 0x67 0xDC 0xEA 0x97 0xF2 0xCF 0xCE 0xF0 0xB4 0xE6 0x73
.byte 0x96 0xAC 0x74 0x22 0xE7 0xAD 0x35 0x85 0xE2 0xF9 0x37 0xE8 0x1C 0x75 0xDF 0x6E
.byte 0x47 0xF1 0x1A 0x71 0x1D 0x29 0xC5 0x89 0x6F 0xB7 0x62 0x0E 0xAA 0x18 0xBE 0x1B
.byte 0xFC 0x56 0x3E 0x4B 0xC6 0xD2 0x79 0x20 0x9A 0xDB 0xC0 0xFE 0x78 0xCD 0x5A 0xF4
.byte 0x1F 0xDD 0xA8 0x33 0x88 0x07 0xC7 0x31 0xB1 0x12 0x10 0x59 0x27 0x80 0xEC 0x5F
.byte 0x60 0x51 0x7F 0xA9 0x19 0xB5 0x4A 0x0D 0x2D 0xE5 0x7A 0x9F 0x93 0xC9 0x9C 0xEF
.byte 0xA0 0xE0 0x3B 0x4D 0xAE 0x2A 0xF5 0xB0 0xC8 0xEB 0xBB 0x3C 0x83 0x53 0x99 0x61
.byte 0x17 0x2B 0x04 0x7E 0xBA 0x77 0xD6 0x26 0xE1 0x69 0x14 0x63 0x55 0x21 0x0C 0x7D


inv_mix:
.byte 0x00 0x0e 0x1c 0x12 0x38 0x36 0x24 0x2a 0x70 0x7e 0x6c 0x62 0x48 0x46 0x54 0x5a
.byte 0xe0 0xee 0xfc 0xf2 0xd8 0xd6 0xc4 0xca 0x90 0x9e 0x8c 0x82 0xa8 0xa6 0xb4 0xba
.byte 0xdb 0xd5 0xc7 0xc9 0xe3 0xed 0xff 0xf1 0xab 0xa5 0xb7 0xb9 0x93 0x9d 0x8f 0x81
.byte 0x3b 0x35 0x27 0x29 0x03 0x0d 0x1f 0x11 0x4b 0x45 0x57 0x59 0x73 0x7d 0x6f 0x61
.byte 0xad 0xa3 0xb1 0xbf 0x95 0x9b 0x89 0x87 0xdd 0xd3 0xc1 0xcf 0xe5 0xeb 0xf9 0xf7
.byte 0x4d 0x43 0x51 0x5f 0x75 0x7b 0x69 0x67 0x3d 0x33 0x21 0x2f 0x05 0x0b 0x19 0x17
.byte 0x76 0x78 0x6a 0x64 0x4e 0x40 0x52 0x5c 0x06 0x08 0x1a 0x14 0x3e 0x30 0x22 0x2c
.byte 0x96 0x98 0x8a 0x84 0xae 0xa0 0xb2 0xbc 0xe6 0xe8 0xfa 0xf4 0xde 0xd0 0xc2 0xcc
.byte 0x41 0x4f 0x5d 0x53 0x79 0x77 0x65 0x6b 0x31 0x3f 0x2d 0x23 0x09 0x07 0x15 0x1b
.byte 0xa1 0xaf 0xbd 0xb3 0x99 0x97 0x85 0x8b 0xd1 0xdf 0xcd 0xc3 0xe9 0xe7 0xf5 0xfb
.byte 0x9a 0x94 0x86 0x88 0xa2 0xac 0xbe 0xb0 0xea 0xe4 0xf6 0xf8 0xd2 0xdc 0xce 0xc0
.byte 0x7a 0x74 0x66 0x68 0x42 0x4c 0x5e 0x50 0x0a 0x04 0x16 0x18 0x32 0x3c 0x2e 0x20
.byte 0xec 0xe2 0xf0 0xfe 0xd4 0xda 0xc8 0xc6 0x9c 0x92 0x80 0x8e 0xa4 0xaa 0xb8 0xb6
.byte 0x0c 0x02 0x10 0x1e 0x34 0x3a 0x28 0x26 0x7c 0x72 0x60 0x6e 0x44 0x4a 0x58 0x56
.byte 0x37 0x39 0x2b 0x25 0x0f 0x01 0x13 0x1d 0x47 0x49 0x5b 0x55 0x7f 0x71 0x63 0x6d
.byte 0xd7 0xd9 0xcb 0xc5 0xef 0xe1 0xf3 0xfd 0xa7 0xa9 0xbb 0xb5 0x9f 0x91 0x83 0x8d
.byte 0x00 0x0b 0x16 0x1d 0x2c 0x27 0x3a 0x31 0x58 0x53 0x4e 0x45 0x74 0x7f 0x62 0x69
.byte 0xb0 0xbb 0xa6 0xad 0x9c 0x97 0x8a 0x81 0xe8 0xe3 0xfe 0xf5 0xc4 0xcf 0xd2 0xd9
.byte 0x7b 0x70 0x6d 0x66 0x57 0x5c 0x41 0x4a 0x23 0x28 0x35 0x3e 0x0f 0x04 0x19 0x12
.byte 0xcb 0xc0 0xdd 0xd6 0xe7 0xec 0xf1 0xfa 0x93 0x98 0x85 0x8e 0xbf 0xb4 0xa9 0xa2
.byte 0xf6 0xfd 0xe0 0xeb 0xda 0xd1 0xcc 0xc7 0xae 0xa5 0xb8 0xb3 0x82 0x89 0x94 0x9f
.byte 0x46 0x4d 0x50 0x5b 0x6a 0x61 0x7c 0x77 0x1e 0x15 0x08 0x03 0x32 0x39 0x24 0x2f
.byte 0x8d 0x86 0x9b 0x90 0xa1 0xaa 0xb7 0xbc 0xd5 0xde 0xc3 0xc8 0xf9 0xf2 0xef 0xe4
.byte 0x3d 0x36 0x2b 0x20 0x11 0x1a 0x07 0x0c 0x65 0x6e 0x73 0x78 0x49 0x42 0x5f 0x54
.byte 0xf7 0xfc 0xe1 0xea 0xdb 0xd0 0xcd 0xc6 0xaf 0xa4 0xb9 0xb2 0x83 0x88 0x95 0x9e
.byte 0x47 0x4c 0x51 0x5a 0x6b 0x60 0x7d 0x76 0x1f 0x14 0x09 0x02 0x33 0x38 0x25 0x2e
.byte 0x8c 0x87 0x9a 0x91 0xa0 0xab 0xb6 0xbd 0xd4 0xdf 0xc2 0xc9 0xf8 0xf3 0xee 0xe5
.byte 0x3c 0x37 0x2a 0x21 0x10 0x1b 0x06 0x0d 0x64 0x6f 0x72 0x79 0x48 0x43 0x5e 0x55
.byte 0x01 0x0a 0x17 0x1c 0x2d 0x26 0x3b 0x30 0x59 0x52 0x4f 0x44 0x75 0x7e 0x63 0x68
.byte 0xb1 0xba 0xa7 0xac 0x9d 0x96 0x8b 0x80 0xe9 0xe2 0xff 0xf4 0xc5 0xce 0xd3 0xd8
.byte 0x7a 0x71 0x6c 0x67 0x56 0x5d 0x40 0x4b 0x22 0x29 0x34 0x3f 0x0e 0x05 0x18 0x13
.byte 0xca 0xc1 0xdc 0xd7 0xe6 0xed 0xf0 0xfb 0x92 0x99 0x84 0x8f 0xbe 0xb5 0xa8 0xa3
.byte 0x00 0x0d 0x1a 0x17 0x34 0x39 0x2e 0x23 0x68 0x65 0x72 0x7f 0x5c 0x51 0x46 0x4b
.byte 0xd0 0xdd 0xca 0xc7 0xe4 0xe9 0xfe 0xf3 0xb8 0xb5 0xa2 0xaf 0x8c 0x81 0x96 0x9b
.byte 0xbb 0xb6 0xa1 0xac 0x8f 0x82 0x95 0x98 0xd3 0xde 0xc9 0xc4 0xe7 0xea 0xfd 0xf0
.byte 0x6b 0x66 0x71 0x7c 0x5f 0x52 0x45 0x48 0x03 0x0e 0x19 0x14 0x37 0x3a 0x2d 0x20
.byte 0x6d 0x60 0x77 0x7a 0x59 0x54 0x43 0x4e 0x05 0x08 0x1f 0x12 0x31 0x3c 0x2b 0x26
.byte 0xbd 0xb0 0xa7 0xaa 0x89 0x84 0x93 0x9e 0xd5 0xd8 0xcf 0xc2 0xe1 0xec 0xfb 0xf6
.byte 0xd6 0xdb 0xcc 0xc1 0xe2 0xef 0xf8 0xf5 0xbe 0xb3 0xa4 0xa9 0x8a 0x87 0x90 0x9d
.byte 0x06 0x0b 0x1c 0x11 0x32 0x3f 0x28 0x25 0x6e 0x63 0x74 0x79 0x5a 0x57 0x40 0x4d
.byte 0xda 0xd7 0xc0 0xcd 0xee 0xe3 0xf4 0xf9 0xb2 0xbf 0xa8 0xa5 0x86 0x8b 0x9c 0x91
.byte 0x0a 0x07 0x10 0x1d 0x3e 0x33 0x24 0x29 0x62 0x6f 0x78 0x75 0x56 0x5b 0x4c 0x41
.byte 0x61 0x6c 0x7b 0x76 0x55 0x58 0x4f 0x42 0x09 0x04 0x13 0x1e 0x3d 0x30 0x27 0x2a
.byte 0xb1 0xbc 0xab 0xa6 0x85 0x88 0x9f 0x92 0xd9 0xd4 0xc3 0xce 0xed 0xe0 0xf7 0xfa
.byte 0xb7 0xba 0xad 0xa0 0x83 0x8e 0x99 0x94 0xdf 0xd2 0xc5 0xc8 0xeb 0xe6 0xf1 0xfc
.byte 0x67 0x6a 0x7d 0x70 0x53 0x5e 0x49 0x44 0x0f 0x02 0x15 0x18 0x3b 0x36 0x21 0x2c
.byte 0x0c 0x01 0x16 0x1b 0x38 0x35 0x22 0x2f 0x64 0x69 0x7e 0x73 0x50 0x5d 0x4a 0x47
.byte 0xdc 0xd1 0xc6 0xcb 0xe8 0xe5 0xf2 0xff 0xb4 0xb9 0xae 0xa3 0x80 0x8d 0x9a 0x97
.byte 0x00 0x09 0x12 0x1b 0x24 0x2d 0x36 0x3f 0x48 0x41 0x5a 0x53 0x6c 0x65 0x7e 0x77
.byte 0x90 0x99 0x82 0x8b 0xb4 0xbd 0xa6 0xaf 0xd8 0xd1 0xca 0xc3 0xfc 0xf5 0xee 0xe7
.byte 0x3b 0x32 0x29 0x20 0x1f 0x16 0x0d 0x04 0x73 0x7a 0x61 0x68 0x57 0x5e 0x45 0x4c
.byte 0xab 0xa2 0xb9 0xb0 0x8f 0x86 0x9d 0x94 0xe3 0xea 0xf1 0xf8 0xc7 0xce 0xd5 0xdc
.byte 0x76 0x7f 0x64 0x6d 0x52 0x5b 0x40 0x49 0x3e 0x37 0x2c 0x25 0x1a 0x13 0x08 0x01
.byte 0xe6 0xef 0xf4 0xfd 0xc2 0xcb 0xd0 0xd9 0xae 0xa7 0xbc 0xb5 0x8a 0x83 0x98 0x91
.byte 0x4d 0x44 0x5f 0x56 0x69 0x60 0x7b 0x72 0x05 0x0c 0x17 0x1e 0x21 0x28 0x33 0x3a
.byte 0xdd 0xd4 0xcf 0xc6 0xf9 0xf0 0xeb 0xe2 0x95 0x9c 0x87 0x8e 0xb1 0xb8 0xa3 0xaa
.byte 0xec 0xe5 0xfe 0xf7 0xc8 0xc1 0xda 0xd3 0xa4 0xad 0xb6 0xbf 0x80 0x89 0x92 0x9b
.byte 0x7c 0x75 0x6e 0x67 0x58 0x51 0x4a 0x43 0x34 0x3d 0x26 0x2f 0x10 0x19 0x02 0x0b
.byte 0xd7 0xde 0xc5 0xcc 0xf3 0xfa 0xe1 0xe8 0x9f 0x96 0x8d 0x84 0xbb 0xb2 0xa9 0xa0
.byte 0x47 0x4e 0x55 0x5c 0x63 0x6a 0x71 0x78 0x0f 0x06 0x1d 0x14 0x2b 0x22 0x39 0x30
.byte 0x9a 0x93 0x88 0x81 0xbe 0xb7 0xac 0xa5 0xd2 0xdb 0xc0 0xc9 0xf6 0xff 0xe4 0xed
.byte 0x0a 0x03 0x18 0x11 0x2e 0x27 0x3c 0x35 0x42 0x4b 0x50 0x59 0x66 0x6f 0x74 0x7d
.byte 0xa1 0xa8 0xb3 0xba 0x85 0x8c 0x97 0x9e 0xe9 0xe0 0xfb 0xf2 0xcd 0xc4 0xdf 0xd6
.byte 0x31 0x38 0x23 0x2a 0x15 0x1c 0x07 0x0e 0x79 0x70 0x6b 0x62 0x5d 0x54 0x4f 0x46



.text
main:
	li $t9,0
	sub $sp, $sp, 100
 	sw	$ra, 0($sp)
	sw	$s0, 4($sp)   # encrypted[0-16]
	sw	$s1, 8($sp)
	sw	$s2, 12($sp)
	sw	$s3, 16($sp)
	sw	$s4, 20($sp)  # key
	sw	$s5, 24($sp)  #rounds
	sw	$s6, 28($sp)	#unique_chars
	sw	$s7, 32($sp)	#plaintext

	la $t8, starcoin_count
	sw $t9, 0($t8)

	la $t8, start_part_2
	sw $0, 0($t8)

eat:
    la  $t0, puzzle_data
    sw  $t0, REQUEST_PUZZLE
	li $t4,REQUEST_RADAR_INT_MASK
	or $t4,$t4,1         #interrupt enable
	li $t5, REQUEST_PUZZLE_INT_MASK
	or $t4, $t4, $t5
	mtc0 $t4,$12

	sw $0,scan_flag

	li $t8,0
	sw $t8,VELOCITY
	#addi $t9, $t9,1
	la $t8, start_part_2
	lw $t8, 0($t8)

	la $t9, starcoin_count
	lw $t9, 0($t9)
	bne $t8,$0,cyclex

start_scan:
	la $t0,sector_info
	sw $t0,REQUEST_RADAR      #the map of star dust


wait_scan:
	lw  $t5, scan_flag
	beq $t5, 1, xcoor
	j wait_scan


xcoor:
	li $t8,10
	sw $t8,VELOCITY
	#la $t0,sector_infolw $t3,BOT_Y          #get botx
	lw $t4,BOT_X
	mul $t5, $t3,300
	add $t5, $t5,$t4
	la $t0, event_horizon_data

	add $t5, $t0,$t5
	lb $t5, 0($t5)
	beq $t5,2, run123
	#sw $t0,REQUEST_RADAR
	lw $t3,BOT_X          #get botx
	la $t0,sector_info
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
	li $t5,7500
	li $t6,0
	li $t7,-12
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
	#sw $t0,REQUEST_RADAR
	la $t0,sector_info
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
	la $t9, starcoin_count
	lw $t9, 0($t9)
	add $t9,$t9,1
	j eat
down:
	li $t6,90
	sw $t6,ANGLE
	li $t2,1
	sw $t2,ANGLE_CONTROL
	j ycoor


cyclex:         ##get y
	la $t0, event_horizon_data
	sw $t0, REQUEST_JETSTREAM
	li $t8,10
	sw $t8,VELOCITY
	lw $t3,BOT_Y          #get botx
	lw $t4,BOT_X
	mul $t5, $t3,300
	add $t5, $t5,$t4
	add $t5, $t0,$t5
	lb $t5, 0($t0)
	beq $t5,2, run123

	blt $t3, 109, movedown
	bgt $t3, 109, moveup

	j movex

movex:
	la $t0, event_horizon_data
	sw $t0, REQUEST_JETSTREAM
	li $t8,10
	sw $t8,VELOCITY
	lw $t3,BOT_Y          #get botx
	lw $t4,BOT_X
	mul $t5, $t3,300
	add $t5, $t5,$t4
	add $t5, $t0,$t5
	lb $t5, 0($t5)
	beq $t5,2, run123

	blt $t4, 150, moveright
moveleft:
	li $t8,10
	sw $t8,VELOCITY
	lw $t3,BOT_Y          #get botx
	lw $t4,BOT_X
	mul $t5, $t3,300
	add $t5, $t5,$t4
	la $t0, event_horizon_data
	add $t5, $t0,$t5
	lb $t5, 0($t5)
	beq $t5,2, run123
	li $t6,180
	sw $t6,ANGLE
	li $t2,1
	sw $t2,ANGLE_CONTROL
	j moveleft

moveright:
	li $t8,10
	sw $t8,VELOCITY
	lw $t3,BOT_Y          #get botx
	lw $t4,BOT_X
	mul $t5, $t3,300
	add $t5, $t5,$t4
	la $t0, event_horizon_data

	add $t5, $t0,$t5
	lb $t5, 0($t5)
	beq $t5,2, run123
	li $t6,0
	sw $t6,ANGLE
	li $t2,1
	sw $t2,ANGLE_CONTROL
	j moveright




movedown:
li $t8,10
sw $t8,VELOCITY
lw $t3,BOT_Y          #get botx
lw $t4,BOT_X
mul $t5, $t3,300
add $t5, $t5,$t4
la $t0, event_horizon_data

add $t5, $t0,$t5
lb $t5, 0($t5)
beq $t5,2, run123
	li $t6,90
	sw $t6,ANGLE
	li $t2,1
	sw $t2,ANGLE_CONTROL
	j cyclex
moveup:
	li $t8,10
	sw $t8,VELOCITY
	lw $t3,BOT_Y          #get botx
	lw $t4,BOT_X
	mul $t5, $t3,300
	add $t5, $t5,$t4
	la $t0, event_horizon_data

	add $t5, $t0,$t5
	lb $t5, 0($t5)
	beq $t5,2, run123
	li $t6, 270
	sw $t6,ANGLE
	li $t2,1
	sw $t2,ANGLE_CONTROL
	j cyclex

runcycle:

	j anothermain
	la $t0,sector_info
	sw $t0,REQUEST_RADAR      #the map of star dust
pushoutstar:
	la $t0,sector_info
	lw $t1, 0($t0)
	beq $t1,0xffffffff, banana
	add $t0,$t0,1
	j pushoutstar

banana:
	la $t0,sector_info
	lw $t1,1($t0)
	beq $t1,0xffffffff, run123
	srl $t3, $t1,16  #y
	and $t4,0xffff   #x
	sub $t3,$t3,5
	sub $t4,$t4,5
	la   $t0, event_horizon_data
	sw	 $t0, REQUEST_JETSTREAM      #t0 is the map
	li $t5,0
	li $t6,0
	j outer_loop

outer_loop:
	bgt $t5,10,run123
	j inner_loop
inner_loop:
	bgt $t6,10,updateouter
	mul $t7,$t3,300
	add $t7,$t7,$t4
	la   $t0, event_horizon_data
	add $t7, $t7,$t0
	li $t8,1
	sb $t8, 0($t7)
	add $t4,$t4,1
	add $t6,$t6,1
	j inner_loop
updateouter:
	add $t5,$t5,1
	add $t3,$t3,1
	sub $t4,$t4,10
	j outer_loop
run123:
	li $t8,0
loopbalh:
	bgt $t8,10,anothermain
	add $t8,$t8,1
	j loopbalh


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
infinite:
	j  infinite
anothermain:
	la  $t0, event_horizon_data
	sw  $t0, REQUEST_JETSTREAM
	li  $t7, 0
	sw  $t7, ANGLE
	li  $t7, 1
	sw  $t7, ANGLE_CONTROL
	li  $t7, 10
	sw  $t7, VELOCITY
	li	$t4, REQUEST_RADAR_INT_MASK
	or	$t4, $t4, 1
	mtc0	$t4, $12
	li $a0 , 0

keeprunning:
	add $a0, $a0, 1
	lw  $t5, BOT_X
	lw  $t1, BOT_Y
search:
	bge	$a0, 100, qqq
	j   xlocation
qqq:
	la	$t7, sector_info
	sw	$t7, REQUEST_RADAR
	li  $a0, 0
xlocation:
	bge $t5, 150, youbian
	bge $t1, 150, rightandup
second:
	add $t5, $t5, 1
	mul $t1, $t1, 300
	add $t2, $t5, $t1
	add $t2, $t2, $t0
	lb  $t3, 0($t2)
	beq $t3, 2, turnright
	sub $t2, $t2, 301
	lb  $t3, 0($t2)
	beq $t3, 4, turnright
	li  $t6, 5
	sw  $t6, VELOCITY
	li  $t4, 270                                # if right not ok, go up
	sw  $t4, ANGLE
	li  $t7, 1
	sw  $t7, ANGLE_CONTROL
	j   keeprunning
moveup2:
		li  $t4, 270
		sw  $t4, ANGLE
		li  $t7, 1
		sw  $t7, ANGLE_CONTROL
		li  $t6, 5
		sw  $t6, VELOCITY
		j   keeprunning
turnright:
	li  $t6, 5
	sw  $t6, VELOCITY
  	li  $t4, 0                                  # if right ok, go right
  	sw  $t4, ANGLE
	li  $t7, 1
	sw  $t7, ANGLE_CONTROL
  	j   keeprunning
rightandup:
	sub $t1, $t1, 1
	mul $t1, $t1, 300
	add $t2, $t5, $t1
	la  $t0, event_horizon_data
	add $t2, $t2, $t0
	lb  $t3, 0($t2)
	beq $t3, 2, moveup2
	add $t2, $t2, 299
	lb  $t3, 0($t2)
	beq $t3, 4, moveup2
	li  $t6, 5
	sw  $t6, VELOCITY
	li  $t6, 180
	sw  $t6, ANGLE
	li  $t6, 1
	sw  $t6, ANGLE_CONTROL
	j   keeprunning
youbian:
	bge $t1, 150, downandleft
first:
	add $t1, $t1, 1
	mul $t1, $t1, 300
	add $t2, $t5, $t1
	la  $t0, event_horizon_data
	add $t2, $t2, $t0
	lb  $t3, 0($t2)
	beq $t3, 2, downward
	sub $t2, $t2, 299
	lb  $t3, 0($t2)
	beq $t3, 4, downward
	li  $t6, 7
	sw  $t6, VELOCITY
	li  $t4, 0
	sw  $t4, ANGLE
	li  $t7, 1
	sw  $t7, ANGLE_CONTROL
	j   keeprunning

avoidleftbanana:
		li  $t4, 180
		sw  $t4, ANGLE
		li  $t7, 1
		sw  $t7, ANGLE_CONTROL
		li  $t6, 10
		sw  $t6, VELOCITY
		j   keeprunning

downward:
	li  $t9, 10
	sw  $t9, VELOCITY
	li  $t8, 90
	sw  $t8, ANGLE
	li  $t6, 1
	sw  $t6, ANGLE_CONTROL
	j   keeprunning

	shift44:
		li  $t8, 1
		sw  $t8, ANGLE_CONTROL
		li  $t7, 44
		sw  $t7, ANGLE
		li  $t8, 10
		sw  $t8, VELOCITY

		j   shift45

downandleft:
	sub $t5, $t5, 1
	mul $t1, $t1, 300
	add $t2, $t5, $t1
	la  $t0, event_horizon_data
	add $t2, $t2, $t0
	lb  $t3, 0($t2)
	beq $t3, 2, avoidleftbanana
	add $t2, $t2, 301
	lb  $t3, 0($t2)
	beq $t3, 4, avoidleftbanana
	li  $t6, 10
	sw  $t6, VELOCITY
	li  $t4, 90
	sw  $t4, ANGLE
	li  $t7, 1
	sw  $t7, ANGLE_CONTROL
	j   keeprunning




.kdata
chunkIH:.space 40 # 2 registers?
non_intrpt_str: .asciiz "Non-interrupt exception\n"
unhandled_str: .asciiz "Unhandled interrupt type\n"

.ktext  0x80000180
interrupt_handler:
.set noat
	move $k1,$at
.set at
	la	$k0, chunkIH
	sw	$a0, 0($k0)
	sw	$a1, 4($k0)
	sw	$t0, 8($k0)
	sw	$t1, 12($k0)
	sw	$t2, 16($k0)
	sw	$t3, 20($k0)
	sw	$t4, 24($k0)
	sw	$v0, 28($k0)
	sw	$t5, 32($k0)
	sw	$t6, 36($k0)
	mfc0 	$k0, $13 		# Get Cause register
	srl 	$a0, $k0, 2
	and 	$a0, $a0, 0xf		# ExcCode field
	bne 	$a0, 0, non_intrpt


interrupt_dispatch:
	mfc0 $k0, $13
	beq $k0, $zero, done   #handle all
	and $a0, $k0, 0x4000   # is there a scan interrupt?
	bne $a0, 0, RADAR_interrupt
	and $a0, $k0, 0x800
	bne $a0, 0, puzzle_interrupt


	li $v0,4
	la $a0, unhandled_str
	syscall
	j done

puzzle_interrupt:


	sw $a1, REQUEST_PUZZLE_ACK
	la $a0, puzzle_data
	jal solve_puzzle

	la $t8, start_part_2
	li $t6, 1
	sw $t6, 0($t8)

	# sw $v0

	la $t0,sector_info
	sw $t0,REQUEST_RADAR


	# la $t7, start_puzzle
	# li $t8, 1
	# sw $t8,0($t7)
	# sw $0, REQUEST_PUZZLE_ACK

	# # la $t6, start_puzzle
	# # lw $t7, 0($t6)
	# # beq $t7,1,try_solve
	# # la $a0, puzzle_data
	# # jal solve_puzzle
	# # sw $v0, SUBMIT_SOLUTION
	# la $a0, puzzle_data
	# jal solve_puzzle
	# sw $v0, SUBMIT_SOLUTION



	j interrupt_dispatch




RADAR_interrupt:
	la $t7,scan_flag
	li $t8,1
	sw $t8,0($t7)
	sw	$a1, REQUEST_RADAR_ACK
	la	$t6, sector_info

wipeoutstar:

	lw  $t0, 0($t6)
	beq $t0, 0xffffffff, findbanana
	add $t6, $t6, 4
	j   wipeoutstar

findbanana:


	add $t6, $t6, 4
	lw	$t0, 0($t6)                             	# location of the first banana
	beq	$t0, 0xffffffff, interrupt_dispatch	      # no banana found

	srl	$t3, $t0, 16
	and	$t3, $t3, 0x0000ffff	# banana_X
	and	$t4, $t0, 0x0000ffff	# banana_Y
	sub $t3, $t3, 4
	sub $t4, $t4, 4
	mul $t4, $t4, 300
	add $t3, $t3, $t4
	la  $t5, event_horizon_data
	add $t3, $t3, $t5
	li  $t4, 4
	li 	$t8, 0
	li 	$t1,0
outer:
	bgt $t8,8,findbanana
inner:
	bgt $t1,8,update
	sb $t4,0($t3)
	add $t3,$t3,1
	add $t1,$t1,1
	j inner
update:
	add $t8,$t8,1
	sub $t3,$t3,8
	add $t3,$t3,300
	j outer
non_intrpt:
	li $v0,4
	la $a0,non_intrpt_str
	syscall
	j done

done:
		li  $t5, 10
	sw  $t5, VELOCITY
	la	$k0, chunkIH
	lw	$a0, 0($k0)
	lw	$a1, 4($k0)
	lw	$t0, 8($k0)
	lw	$t1, 12($k0)
	lw	$t2, 16($k0)
	lw	$t3, 20($k0)
	lw	$t4, 24($k0)
	lw	$v0, 28($k0)
	lw	$t5, 32($k0)
	lw	$t6, 36($k0)
.set noat
	move $at, $k1
.set at
	eret



###############
.globl solve_puzzle
solve_puzzle:

	sub $sp, $sp, 100
 	sw	$ra, 0($sp)
	sw	$s0, 4($sp)   # encrypted[0-16]
	sw	$s1, 8($sp)
	sw	$s2, 12($sp)
	sw	$s3, 16($sp)
	sw	$s4, 20($sp)  # key
	sw	$s5, 24($sp)  #rounds
	sw	$s6, 28($sp)	#unique_chars
	sw	$s7, 32($sp)	#plaintext

	add $s0, $a0, 0
	add $s4, $a0, 64
	lb  $s5, 208($a0)
	lw  $s6, 212($a0)
	sub $sp, $sp, 64
	move $s7, $sp
	sub $sp, $sp, 64
	move $s1, $sp

	move $a0, $s0
	add $a1, $s7, 0
	move $a2, $s4
	move $a3, $s5
	jal decrypt


	add $a0, $s0, 16
	add $a1, $s7, 16
	move $a2, $s4
	move $a3, $s5
	jal decrypt


	add $a0, $s0, 32
	add $a1, $s7, 32
	move $a2, $s4
	move $a3, $s5
	jal decrypt


	add $a0, $s0, 48
	add $a1, $s7, 48
	move $a2, $s4
	move $a3, $s5
	jal decrypt

	move $a0, $s7
	move $a1, $s1
	move $a2, $s6
	jal max_unique_n_substr

	move $v0, $s1
	sw $s1, SUBMIT_SOLUTION

	add $sp, $sp, 128
	lw	$ra, 0($sp)
	lw	$s0, 4($sp)
	lw	$s1, 8($sp)
	lw	$s2, 12($sp)
	lw	$s3, 16($sp)
	lw	$s4, 20($sp)
	lw	$s5, 24($sp)
	lw	$s6, 28($sp)
	lw	$s7, 32($sp)
	add $sp, $sp, 36
	jr $ra

###############
.globl decrypt
decrypt:
    # Your code goes here :)
    #There is the stack mem and the saved reg
    sub $sp, $sp, 100
 	sw	$ra, 0($sp)
	sw	$s0, 4($sp)
	sw	$s1, 8($sp)
	sw	$s2, 12($sp)
	sw	$s3, 16($sp)
	sw	$s4, 20($sp)
	sw	$s5, 24($sp)
	sw	$s6, 28($sp)
	sw	$s7, 32($sp)


    #Args, except rounds
    move $s0, $a0
    move $s1, $a1
    move $s2, $a2
    #stored in s7
    move $s7, $a3

    #A,B,C D loc
    add $s3, $sp, 36
    add $s4, $sp, 52
    add $s5, $sp, 68
    add $s6, $sp, 84

    move $a0, $s0
    mul $t0, $s7,16
    add $a1,$s2 ,$t0
    move $a2, $s5
    jal key_addition

    move $a0, $s5
    move $a1, $s4
    jal inv_shift_rows

    move $a0,$s4
    move $a1,$s3
    jal inv_byte_substitution

    #Rounds - 1
    sub $s7, $s7, 1
for_loop:
    ble $s7, 0,end_for_loop

    move $a0, $s3
    mul $t0, $s7,16
    add $a1, $s2,$t0
    move $a2, $s6
    jal key_addition

    move $a0, $s6
    move $a1, $s5
    jal inv_mix_column

    move $a0, $s5
    move $a1, $s4
    jal inv_shift_rows

    move $a0,$s4
    move $a1,$s3
    jal inv_byte_substitution

    sub $s7, $s7, 1
    j for_loop
end_for_loop:

    move $a0, $s3
    move $a1, $s2
    move $a2, $s1
    jal key_addition

 	lw	$ra, 0($sp)
	lw	$s0, 4($sp)
	lw	$s1, 8($sp)
	lw	$s2, 12($sp)
	lw	$s3, 16($sp)
	lw	$s4, 20($sp)
	lw	$s5, 24($sp)
	lw	$s6, 28($sp)
	lw	$s7, 32($sp)
    add $sp, $sp, 100

    jr $ra




##############
.globl circular_shift
circular_shift:
	mul	$t0, $a1, 8
	srl	$t1, $a0, $t0
	sub	$t2, $0, $t0
	add	$t2, $t2, 32
	sll	$t2, $a0, $t2
	or	$v0, $t1, $t2
	jr	$ra

.globl inv_byte_substitution
inv_byte_substitution:
	li	$t0, 0
	la	$t1, inv_sbox
inv_byte_substitution_for:
	bge	$t0, 16, inv_byte_substitution_end
	add	$t9, $a0, $t0
	lbu	$t9, 0($t9)
	add	$t9, $t1, $t9
	lbu	$t9, 0($t9)
	add	$t8, $a1, $t0
	sb	$t9, 0($t8)
	add	$t0, $t0, 1
	j	inv_byte_substitution_for
inv_byte_substitution_end:
	jr	$ra

.globl key_addition
key_addition:
	li	$t0, 0
key_addition_for:
	bge	$t0, 16, key_addition_end
	add	$t1, $a0, $t0
	add	$t2, $a1, $t0
	lbu	$t1, 0($t1)
	lbu	$t2, 0($t2)
	xor	$t1, $t1, $t2
	add	$t2, $a2, $t0
	sb	$t1, 0($t2)
	add	$t0, $t0, 1
	j	key_addition_for
key_addition_end:
	jr	$ra

.globl inv_shift_rows
inv_shift_rows:
	#7 saved registers, 20 for stack
	sub	$sp, $sp, 36
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)
	sw	$s1, 8($sp)
	sw	$s2, 12($sp)
	sw	$s3, 16($sp)

	#Assign M
	add	$s0, $sp, 20
	#Assign in
	move	$s1, $a0
	#assign out
	move	$s2, $a1

	move	$a0, $s1
	move	$a1, $s0
	jal	rearrange_matrix

	#Assign I
	move	$s3, $zero
for_loop_2:
	bge	$s3, 4, end_for

	li	$a1, 4
	sub	$a1, $a1, $s3

	mul	$t0, $s3, 4
	add	$t0, $s0, $t0

	lw	$a0, 0($t0)
	jal	circular_shift

	mul	$t0, $s3, 4
	add	$t0, $s0, $t0
	sw	$v0, 0($t0)

	add	$s3, $s3, 1
	j	for_loop_2
end_for:
	move	$a0, $s0
	move	$a1, $s2
	jal	rearrange_matrix

	lw	$ra, 0($sp)
	lw	$s0, 4($sp)
	lw	$s1, 8($sp)
	lw	$s2, 12($sp)
	lw	$s3, 16($sp)
	add	$sp, $sp, 36
	jr	$ra

.globl inv_mix_column
inv_mix_column:
	sub	$sp, $sp, 16
	sw	$s0, 0($sp)
	sw	$s1, 4($sp)
	sw	$s2, 8($sp)
	sw	$s3, 12($sp)

	move	$s0, $zero
for_first:
	bge	$s0, 4, for_first_done
	move	$s1, $zero
for_second:
	bge	$s1, 4, for_second_done

	#store where out[4*k+i] is
	mul	$t0, $s0, 4
	add	$t0, $t0, $s1
	add	$s3, $a1, $t0
	sb	$zero, 0($s3)

	move	$s2, $zero
for_third:
	bge	$s2, 4, for_third_done
	mul	$t0, $s2, 256
	add	$t1, $s1, $s2
	rem	$t1, $t1, 4
	mul	$t2, $s0, 4
	add	$t2, $t2, $t1
	add	$t2, $t2, $a0

	lbu	$t2, 0($t2)

	add	$t0, $t0, $t2
	la	$t4, inv_mix
	add	$t0, $t0, $t4
	lbu	$t0, 0($t0)

	lb	$t5, 0($s3)
	xor	$t5, $t5, $t0
	sb	$t5, 0($s3)

	add	$s2, $s2, 1
	j	for_third
for_third_done:
	add	$s1, $s1, 1
	j	for_second
for_second_done:
	add	$s0, $s0, 1
	j	for_first
for_first_done:
	lw	$s0, 0($sp)
	lw	$s1, 4($sp)
	lw	$s2, 8($sp)
	lw	$s3, 12($sp)
	add	$sp, $sp, 16
	jr	$ra

.globl rearrange_matrix
rearrange_matrix:
	move	$t0, $zero
rm_for_loop:
	bge	$t0, 4, end_for_loop_2

	#pointer to out
	mul	$t1, $t0, 4
	add	$t1, $t1, $a1

	sw	$zero, 0($t1)

	move	$t2, $zero
second_for_loop:
	#load in
	bge	$t2, 4, end_second_for_loop
	mul	$t3, $t2, 4
	add	$t3, $t3, $t0
	add	$t3, $a0, $t3

	lbu	$t4, 0($t3)
	mul	$t5, $t2 ,8
	sllv	$t4, $t4, $t5

	lw	$t5, 0($t1)
	or	$t5, $t5, $t4
	sw	$t5, 0($t1)

	add	$t2, $t2, 1
	j	second_for_loop

end_second_for_loop:
	add	$t0, $t0, 1
	j	rm_for_loop
end_for_loop_2:
	jr	$ra


#################################
max_unique_n_substr:
	beq	$a0, $0, muns_abort 		# !in_str
	beq	$a1, $0, muns_abort		# !out_str
	beq	$a2, $0, muns_abort		# !n
	j	muns_do

muns_abort:
	jr	$ra

muns_do:
	sub	$sp, $sp, 36
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)			# $s0 = char *in_str
	sw	$s1, 8($sp)			# $s1 = char *out_str
	sw	$s2, 12($sp)			# $s2 = int n
	sw	$s3, 16($sp)			# $s3 = char *max_marker
	sw	$s4, 20($sp)			# $s4 = unsigned int len_max
	sw	$s5, 24($sp)			# $s5 = unsigned int len_in_str
	sw	$s6, 28($sp)			# $s6 = unsigned int cur_pos
	sw	$s7, 32($sp)			# $s7 = int len_cur

	move	$s0, $a0
	move	$s1, $a1
	move	$s2, $a2

	move	$s3, $a0			# max_marker = in_str
	li	$s4, 0				# len_max = 0

	jal	my_strlen			# my_strlen(in_str)
	move	$s5, $v0			# len_in_str = my_strlen(in_str)

	li	$s6, 0				# cur_pos = 0
muns_for:
	bge	$s6, $s5, muns_for_end 		# if (cur_pos >= len_in_str), end

	add	$s7, $s0, $s6			# i = in_str + cur_pos

	move	$a0, $s7
	add	$a1, $s2, 1
	jal	nth_uniq_char			# nth_uniq_char(i, n + 1)

	ble	$v0, $s4, muns_for_cont		# if (len_cur <= len_max), continue
	move	$s4, $v0			# len_max = len_cur
	move	$s3, $s7			# max_marker = i

muns_for_cont:
	add	$s6, $s6, 1			# cur_pos++
	j	muns_for

muns_for_end:
	## Setup call to my_strncpy
	move	$a0, $s1
	move	$a1, $s3
	move	$a2, $s4

	lw      $ra, 0($sp)
	lw      $s0, 4($sp)
	lw      $s1, 8($sp)
	lw      $s2, 12($sp)
	lw      $s3, 16($sp)
	lw      $s4, 20($sp)
	lw      $s5, 24($sp)
	lw      $s6, 28($sp)
	lw      $s7, 32($sp)
	add	$sp, $sp, 36

	## Tail call
	j	my_strncpy			# my_strncpy(out_str, max_marker, len_max)

my_strncpy:
	sub	$sp, $sp, 16
	sw	$s0, 0($sp)
	sw	$s1, 4($sp)
	sw	$s2, 8($sp)
	sw	$ra, 12($sp)
	move	$s0, $a0
	move	$s1, $a1
	move	$s2, $a2

	move	$a0, $a1
	jal	my_strlen
	add	$v0, $v0, 1
	bge	$s2, $v0, my_strncpy_if
	move	$v0, $s2
my_strncpy_if:
	li	$t0, 0
my_strncpy_for:
	bge	$t0, $v0, my_strncpy_end
	add	$t1, $s1, $t0
	lb	$t2, 0($t1)
	add	$t1, $s0, $t0
	sb	$t2, 0($t1)
	add	$t0, $t0, 1
	j	my_strncpy_for
my_strncpy_end:
	lw	$s0, 0($sp)
	lw	$s1, 4($sp)
	lw	$s2, 8($sp)
	lw	$ra, 12($sp)
	add	$sp, $sp, 16
	jr	$ra


############
nth_uniq_char:
	beq	$a0, $0, nuc_abort 		# !in_str
	beq	$a1, $0, nuc_abort		# !n
	j	nuc_ok

nuc_abort:
	li	$v0, -1				# return -1
	jr	$ra

nuc_ok:
	la	$t0, uniq_chars			# $t0 = uniq_chars = &uniq_chars[0]
	lb	$t9, 0($a0)			# *in_str
	sb	$t9, 0($t0)			# uniq_chars[0] = *in_str

	li	$t1, 1				# $t1 = int uniq_so_far = 1
	li	$t2, 0				# $t2 = int position = 0
	add	$a0, $a0, 1			# in_str++

nuc_while:
	bge	$t1, $a1, nuc_while_end 	# if (uniq_so_far >= n), end
	lb	$t9, 0($a0)			# *in_str
	beq	$t9, $0, nuc_while_end		# if (*in_str == 0), end

	li	$t3, 1				# $t3 = char is_uniq = 1

	li	$t4, 0				# $t4 = int j = 0
nuc_for:
	bge	$t4, $t1, nuc_for_end

	add	$t9, $t0, $t4			# &uniq_chars[j]
	lb	$t9, 0($t9)			# uniq_chars[j]
	lb	$t8, 0($a0)			# *in_str
	bne	$t9, $t8, nuc_for_cont		# if (uniq_chars[j] != *in_str), skip
	li	$t3, 0
	j	nuc_for_end

nuc_for_cont:
	add	$t4, $t4, 1			# j++
	j	nuc_for

nuc_for_end:
	beq	$t3, $0, nuc_while_cont 	# if (is_uniq == 0), continue
	lb	$t9, 0($a0)			# *in_str
	add	$t8, $t0, $t1			# &uniq_chars[uniq_so_far]
	sb	$t9, 0($t8)			# uniq_chars[uniq_so_far] = *in_str
	add	$t1, $t1, 1			# uniq_so_far++

nuc_while_cont:
	add	$t2, $t2, 1			# position++
	add	$a0, $a0, 1			# in_str++
	j	nuc_while

nuc_while_end:
	bge	$t1, $a1, nuc_end 		# if (uniq_so_far >= n), skip
	add	$t2, $t2, 1			# position++

nuc_end:
	move	$v0, $t2			# return position
	jr	$ra

############
my_strlen:
	move	$v0, $0			# $v0 = unsigned int count = 0
	bne	$a0, $0, ms_while	# if (in != NULL), skip
	jr	$ra			# return 0

ms_while:
	lb	$t0, 0($a0)		# $t0 = *in
	beq	$t0, $0, ms_done	# if (in == 0), done

	add	$v0, $v0, 1		# count++
	add	$a0, $a0, 1		# in++
	j	ms_while

ms_done:
	jr	$ra			# return count
