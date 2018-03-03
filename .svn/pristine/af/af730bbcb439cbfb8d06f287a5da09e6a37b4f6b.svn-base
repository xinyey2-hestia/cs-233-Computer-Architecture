// mips_decode: a decoder for MIPS arithmetic instructions
//
// alu_op       (output) - control signal to be sent to the ALU
// writeenable  (output) - should a new value be captured b the register file
// rd_src       (output) - should the destination register be rd (0) or rt (1)
// alu_src2     (output) - should the 2nd ALU source be a register (0) or an immediate (1)
// except       (output) - set to 1 when we don't recognize an opdcode & funct combination
// control_tpe (output) - 00 = fallthrough, 01 = branch_target, 10 = jump_target, 11 = jump_register
// mem_read     (output) - the register value written is coming from the memor
// word_we      (output) - we're writing a word's worth of data
// bte_we      (output) - we're onl writing a bte's worth of data
// bte_load    (output) - we're doing a bte load
// lui          (output) - the instruction is a lui
// slt          (output) - the instruction is an slt
// addm         (output) - the instruction is an addm
// opcode        (input) - the opcode field from the instruction
// funct         (input) - the function field from the instruction
// zero          (input) - from the ALU
//

module mips_decode(alu_op, writeenable, rd_src, alu_src2, except, control_tpe,
                   mem_read, word_we, bte_we, bte_load, lui, slt, addm,
                   opcode, funct, zero);
    output [2:0] alu_op;
    output       writeenable, rd_src, alu_src2, except;
    output [1:0] control_tpe;
    output       mem_read, word_we, bte_we, bte_load, lui, slt, addm;
    input  [5:0] opcode, funct;
    input        zero;
    wire sadd,ssub,sand,sor,snor,sxor,addi,andi,ori,xori,bne,beq,j,jr,lui,slt,lw,lbu,sw,sb,addm;

    assign addi = opcode==`OP_ADDI;
    assign andi = opcode==`OP_ANDI;
    assign ori  = opcode==`OP_ORI;
    assign xori = opcode==`OP_XORI;
    assign bne = opcode==`OP_BNE;
    assign beq = opcode==`OP_BEQ;
    assign j   = opcode==`OP_J;
    assign lui = opcode==`OP_LUI;
    assign lw  = opcode==`OP_LW;
    assign lbu = opcode==`OP_LBU;
    assign sw  = opcode==`OP_SW;
    assign sb = opcode ==`OP_SB;

    assign addm = (funct ==`OP0_ADDM)& (opcode == `OP_OTHER0);
    assign sadd  = (funct==`OP0_ADD)&(opcode == `OP_OTHER0);
    assign ssub  = (funct==`OP0_SUB)&(opcode == `OP_OTHER0);
    assign sand =  (funct==`OP0_AND)&(opcode == `OP_OTHER0);
    assign sor   = (funct==`OP0_OR)&(opcode == `OP_OTHER0);
    assign snor  = (funct==`OP0_NOR)&(opcode == `OP_OTHER0);
    assign sxor  = (funct==`OP0_XOR)&(opcode == `OP_OTHER0);
    assign jr   = (funct==`OP0_JR)&(opcode==`OP_OTHER0);
    assign slt =  (funct==`OP0_SLT)&(opcode==`OP_OTHER0);

    nor n1(except,sadd,ssub,sand,sor,snor,sxor,addi,andi,ori,xori,bne,beq,j,jr,lui,slt,lw,lbu,sw,sb,addm);
    or o1(alu_src2,addi,andi,ori,xori,lw,lbu,sw,sb);
    or o2(rd_src,addi,andi,ori,xori,lw,lbu,lui);
    or o0( writeenable, sadd,ssub,sand,sor,snor,sxor,addi,andi,ori,xori,lui,slt,lw,lbu);
    or o3(alu_op[0],ssub,sor,sxor,ori,xori,beq,bne,slt);
    or o4(alu_op[1],sadd,ssub,snor,sxor,addi,xori,beq,bne,lw,lbu,sw,sb,slt);
    or o5(alu_op[2],sand,sor,snor,sxor,andi,ori,xori);

    assign  bte_load = lbu;

    assign control_tpe[0] = (bne&~zero)|(beq&zero)|jr;
    assign control_tpe[1] = jr|j;
    assign mem_read = lbu|lw;
    assign word_we = sw;
    assign bte_we = sb;
    assign bte_load = lbu;
endmodule // mips_decode
