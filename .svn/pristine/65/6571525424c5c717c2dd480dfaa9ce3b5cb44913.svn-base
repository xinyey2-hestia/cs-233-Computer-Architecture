`define STATUS_REGISTER 5'd12
`define CAUSE_REGISTER  5'd13
`define EPC_REGISTER    5'd14

module cp0(rd_data, EPC, TakenInterrupt,
           regnum, wr_data, next_pc, TimerInterrupt,
           MTC0, ERET, clock, reset);
    output [31:0] rd_data;
    output [29:0] EPC;
    output        TakenInterrupt;
    input   [4:0] regnum;
    input  [31:0] wr_data;
    input  [29:0] next_pc;
    input         TimerInterrupt, MTC0, ERET, clock, reset;

	wire [31:0] user_status,decoderout,status_register,cause_register;
	wire userenable,exception_level,a1,a2,a3,epcenable,excreset;
	wire [29:0] epcinput,epcout;
  	//wire andx = ~status_register[1] & status_register[0];
    //wire andy = cause_register[15] & status_register[15];
    //assign TakenInterrupt = andx & andy;
	//assign status_register[31:16]=16'b0;
	//assign status_register[15:8] = user_status[15:8];
	//assign status_register[7:2] = 6'b0;
	//assign status_register[1] = exception_level;
	assign status_register = {16'b0,user_status[15:8],6'b0,exception_level,user_status[0]};
	
	//assign cause_register[31:16]=16'b0;
	//assign cause_register[15] = TimerInterrupt;
	assign cause_register = {16'b0,TimerInterrupt,15'b0};

	and a12(a1,cause_register[15],status_register[15]);
	not n1(a2,status_register[1]);
	and a22(a3,a2,status_register[0]);
	and final(TakenInterrupt,a3,a1);



	// regnum decoder
	decoder32 mtc00(decoderout,regnum,MTC0);
	// user data
	mux2v #(30)epc44f3(epcinput,wr_data[31:2],next_pc,TakenInterrupt);
	or o2(epcenable,decoderout[14],TakenInterrupt);
	//wire epcenable = decoderout[14]|TakenInterrupt;
	register #(30) epcregister(epcout,epcinput,clock,epcenable,reset);
	or o1(excreset,ERET,reset);
	//wire excreset = ERET|reset;
	dffe exception(exception_level,1'b1,clock,TakenInterrupt,excreset);
	register useus(user_status,wr_data,clock,decoderout[12],reset);
	assign cause_register[15] = TimerInterrupt;
	//exception leve
	// 	epc	 register
	mux32v dataout(rd_data,0,0,0,0,0,0,0,0,0,0,0,0, status_register, cause_register, {epcout, 		2'b00},0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, regnum);
	assign EPC = epcout;


	
    // your Verilog for coprocessor 0 goes here
endmodule
