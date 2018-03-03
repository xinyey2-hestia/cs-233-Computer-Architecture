// mips_decode: a decoder for MIPS arithmetic instructions
//
// alu_op      (output) - control signal to be sent to the ALU
// writeenable (output) - should a new value be captured by the register file
// rd_src      (output) - should the destination register be rd (0) or rt (1)
// alu_src2    (output) - should the 2nd ALU source be a register (0) or an immediate (1)
// except      (output) - set to 1 when the opcode/funct combination is unrecognized
// opcode      (input)  - the opcode field from the instruction
// funct       (input)  - the function field from the instruction
//

module mips_decode(alu_op, writeenable, rd_src, alu_src2, except, opcode, funct);
    output [2:0] alu_op;
    output       writeenable, rd_src, alu_src2, except;
    input  [5:0] opcode, funct;
    wire sadd,ssub,sand,sor,snor,sxor,addi,andi,ori,xori;

    assign addi = opcode==`OP_ADDI;
    assign andi = opcode==`OP_ANDI;
    assign ori  = opcode==`OP_ORI;
    assign xori = opcode==`OP_XORI;

    assign sadd  = (funct==`OP0_ADD)&(opcode == `OP_OTHER0);
    assign ssub  = (funct==`OP0_SUB)&(opcode == `OP_OTHER0);
    assign sand =  (funct==`OP0_AND)&(opcode == `OP_OTHER0);
    assign sor   = (funct==`OP0_OR)&(opcode == `OP_OTHER0);
    assign snor  = (funct==`OP0_NOR)&(opcode == `OP_OTHER0);
    assign sxor  = (funct==`OP0_XOR)&(opcode == `OP_OTHER0);

    nor n1(except,sadd,ssub,sand,sor,snor,sxor,addi,andi,ori,xori);
    or o1(alu_src2,addi,andi,ori,xori);
    or o2(rd_src,addi,andi,ori,xori);
    or o0( writeenable, sadd,ssub,sand,sor,snor,sxor,addi,andi,ori,xori);
    or o3(alu_op[0],ssub,sor,sxor,ori,xori);
    or o4(alu_op[1],sadd,ssub,snor,sxor,addi,xori);
    or o5(alu_op[2],sand,sor,snor,sxor,andi,ori,xori);

endmodule // mips_decode
