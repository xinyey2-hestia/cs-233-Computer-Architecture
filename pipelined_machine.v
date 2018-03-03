module pipelined_machine(clk, reset);
    input        clk, reset;

    wire [31:0]  PC;
    wire [31:2]  next_PC, PC_plus4, PC_target,PC_plus4_1;
    wire [31:0]  inst;

   
    wire [4:0]   rs = inst[25:21];
    wire [4:0]   rt = inst[20:16];
    wire [4:0]   rd = inst[15:11];
    wire [5:0]   opcode = inst[31:26];
    wire [5:0]   funct = inst[5:0];

    wire [4:0]   wr_regnum,wr_regnum_MW;
    wire [2:0]   ALUOp;

    wire         RegWrite, BEQ, ALUSrc, MemRead, MemWrite, MemToReg, RegDst;
    wire         PCSrc, zero;
    wire [31:0]  rd1_data, rd2_data, B_data, alu_out_data, load_data, wr_data,oldrd1_data,oldB_data;

	wire 		 ForwardA, ForwardB;
	wire [31:0]  rd2_data1,alu_out_data1, inst_1;


    // DO NOT comment out or rename this module
    // or the test bench will break
    register #(30, 30'h100000) PC_reg(PC[31:2], next_PC[31:2], clk, /* enable */1'b1, reset);

    assign PC[1:0] = 2'b0;  // bottom bits hard coded to 00
    adder30 next_PC_adder(PC_plus4, PC[31:2], 30'h1);
	
	register #(30,30'h100000) Piplinepc (PC_plus4_1,PC_plus4,clk,1'b1,reset);
	
 wire [31:0]  imm = {{ 16{inst_1[15]} }, inst_1[15:0] };  // sign-extended immediate
	
    adder30 target_PC_adder(PC_target, PC_plus4_1, imm[29:0]);
    mux2v #(30) branch_mux(next_PC, PC_plus4, PC_target, PCSrc);
    assign PCSrc = BEQ & zero;

    // DO NOT comment out or rename this module
    // or the test bench will break
    instruction_memory imem(inst, PC[31:2]);
	register #(32) PiplineInstr(inst_1,inst,clk,1'b1,reset);

    mips_decode decode(ALUOp, RegWrite, BEQ, ALUSrc, MemRead, MemWrite, MemToReg, RegDst,
                      opcode, funct);

    // DO NOT comment out or rename this module
    // or the test bench will break
    regfile rf (oldrd1_data, rd2_data,
               rs, rt, wr_regnum_MW, wr_data,
               RegWrite, clk, reset);
	mux2v #(32) forwarB(oldB_data,rd2_data,alu_out_data1,ForwardB);
    mux2v #(32) imm_mux(B_data, oldB_data, imm, ALUSrc);
	mux2v #(32) forwa(rd1_data,oldrd1_data, alu_out_data1,ForwardA);
    alu32 alu(alu_out_data, zero, ALUOp, rd1_data, B_data);
	
	register #(32) PipALUout(alu_out_data1,alu_out_data,clk,1'b1,reset);
	register #(32) PiplineW_D(rd2_data1, oldB_data,clk, 1'b1, reset);
	wire MemRead1,MemWrite1,MemToReg_MW,RegWrite_MW;
		
	register #(1)  Piplinecontrol(MemRead1,MemRead,clk,1'b1,reset);
	register #(1)  Piplinecontro(MemWrite1,MemWrite,clk,1'b1,reset);
	register #(1)  Piplinecontr(MemToReg_MW,MemToReg,clk,1'b1,reset);
	register #(5)  Piplineconl(wr_regnum_MW,wr_regnum,clk,1'b1,reset);

    // DO NOT comment out or rename this module
    // or the test bench will break
    data_mem data_memory(load_data, alu_out_data1, rd2_data1, MemRead1, MemWrite1, clk, reset);

    mux2v #(32) wb_mux(wr_data, alu_out_data1, load_data, MemToReg_MW);
    mux2v #(5) rd_mux(wr_regnum, rt, rd, RegDst);



	assign ForwardA = RegWrite_MW&& (rs==wr_regnum_MW);
	assign ForwardB = RegWrite_MW&& (rt==wr_regnum_MW);













endmodule // pipelined_machine
