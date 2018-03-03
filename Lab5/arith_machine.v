// arith_machine: execute a series of arithmetic instructions from an instruction cache
//
// except (output) - set to 1 when an unrecognized instruction is to be executed.
// clock  (input)  - the clock signal
// reset  (input)  - set to 1 to set all registers to zero, set to 0 for normal execution.

module arith_machine(except, clock, reset);
    output      except;
    input       clock, reset;

    wire [31:0] inst;
    wire [31:0] PC;
    wire [31:0] nextPC;
    wire [4:0] Rs;
    wire [4:0] Rt;
    wire [4:0] Rd;
    wire [5:0] opcode;
    wire [5:0] funct;
    wire [15:0] imm;
    wire [31:0] imm32;
    wire [2:0] alu_op;
    wire writeenable,rd_src,alu_src2;
    wire [31:0] rsData;
    wire [31:0] rtData;
    wire [31:0] rdData;
    wire [31:0] sourcetwo;
    wire [4:0] rdNumber;

    assign Rs[4:0] = inst[25:21];
    assign Rt[4:0] = inst[20:16];
    assign Rd[4:0] = inst[15:11];
    assign opcode[5:0] = inst[31:26];
    assign funct [5:0] = inst[5:0];
    assign imm[15:0]  = inst[15:0];
    assign imm32[15:0] = imm[15:0];
    assign imm32[31:16] = {16{imm[15]}};


    // DO NOT comment out or rename this module
    // or the test bench will break
    register #(32) PC_reg(PC,nextPC,clock,1'b1,reset );


    // DO NOT comment out or rename this module
    // or the test bench will break
    instruction_memory im(inst,PC[31:2]);

    // DO NOT comment out or rename this module
    // or the test bench will break


    mips_decode decodeinst(alu_op,writeenable,rd_src,alu_src2,except,opcode,funct);
    // begin the register file

    mux2v #(5) rtorrd(rdNumber,Rd,Rt,rd_src);
    regfile rf (rsData,rtData,Rs,Rt,rdNumber,rdData,writeenable,clock,reset);

    mux2v ifimm(sourcetwo,rtData,imm32,alu_src2);

    alu32 nextaddress(rdData, , , ,rsData,sourcetwo,alu_op);

   alu32 pcplus4(nextPC, , , ,PC,32'h4,`ALU_ADD);




    /* add other modules */


endmodule // arith_machine