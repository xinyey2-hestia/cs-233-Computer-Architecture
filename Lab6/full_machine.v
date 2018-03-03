// full_machine: execute a series of MIPS instructions from an instruction cache
//
// except (output) - set to 1 when an unrecognized instruction is to be executed.
// clock   (input) - the clock signal
// reset   (input) - set to 1 to set all registers to zero, set to 0 for normal execution.

module full_machine(except, clock, reset);
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
    wire [31:0] sourcetwoin,sourcetwoout;
    wire [4:0] rdNumber;

    assign Rs[4:0] = inst[25:21];
    assign Rt[4:0] = inst[20:16];
    assign Rd[4:0] = inst[15:11];
    assign opcode[5:0] = inst[31:26];
    assign funct [5:0] = inst[5:0];
    assign imm[15:0]  = inst[15:0];
    assign imm32[15:0] = imm[15:0];
    assign imm32[31:16] = {16{imm[15]}};
    // lab5


    wire [1:0] control_type,dataout;
    wire lui,mem_read,byte_load,word_we,byte_we,slt,zero,negative,addm,overflow;
    wire [31:0] alu_out,data_out,br_offset,PC4,bl_in,addm_out,mem_in,addr;
    wire [31:0] zeros,ngs,slt_out,word_out,mem_out,lui_input,jump,branchof;

    wire [7:0] bytes;

    assign ngs[31:1] = zeros[31:1];
    assign ngs[0] = negative;
    assign lui_input[31:16] = inst[15:0];
    assign lui_input[15:0] = 16'b0;
    assign jump[31:28] = PC[31:28];
    assign jump[27:2] = inst[25:0];
    assign jump[1:0] = 2'b0;
    assign bl_in[31:8] = zeros[31:8];
    assign bl_in[7:0] = bytes;
    assign zeros[31:0] = 32'b0;

    assign addr = alu_out;





    // DO NOT comment out or rename this module
    // or the test bench will break
    register #(32) PC_reg(PC,nextPC,clock,1'b1,reset);


    instruction_memory im(inst[31:0],PC[31:2] );
    // decoder begin
    regfile rf (rsData,rtData,Rs,Rt,rdNumber,rdData,writeenable,clock,reset);
    mips_decode b2(alu_op, writeenable, rd_src, alu_src2, except, control_type,
                       mem_read, word_we, byte_we, byte_load, lui, slt, addm,
                       opcode, funct, zero);
    // DO NOT comment out or rename this module
    // or the test bench will break
    data_mem datamemory(data_out, addr, rtData, word_we, byte_we, clock, reset);


    // alu part
    alu32 alu(alu_out, overflow, zero, negative,rsData,sourcetwoout,alu_op);
    alu32 pcplus4(PC4, , , ,PC,32'h4,`ALU_ADD);
    alu32 branch(br_offset,,,,PC4,branchof,`ALU_ADD);
    alu32  adm(addm_out, , ,, rtData, data_out, 3'b010);




    mux2v #(5) rtorrd(rdNumber,Rd,Rt,rd_src);
    mux2v ifimm(sourcetwoin,rtData,imm32,alu_src2);
    mux4v control(nextPC,PC4,br_offset,jump,rsData,control_type);
    mux2v slt1(slt_out,alu_out,ngs,slt);
    mux2v borw(word_out,data_out,bl_in,byte_load);
    mux2v mem1(mem_out,slt_out,mem_in,mem_read);
    mux2v lui1(rdData,mem_out,lui_input,lui);

    mux4v #(8) byte(bytes,data_out[7:0],data_out[15:8],data_out[23:16],data_out[31:24],alu_out[1:0]);

    mux2v  m8( mem_in, word_out, addm_out, addm);
   mux2v m9( sourcetwoout, sourcetwoin, zeros, addm);



    shift_left2 br(branchof,imm32[29:0]);
endmodule // full_machine



module shift_left2(out,in);
	output [31:0] out;
	input [29:0] in;
	assign out[31:2]=in[29:0];
	assign out[1]=0;
	assign out[0]=0;
endmodule
