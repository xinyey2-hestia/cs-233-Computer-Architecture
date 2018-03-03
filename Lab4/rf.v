// register: A register which may be reset to an arbirary value
//
// q      (output) - Current value of register
// d      (input)  - Next value of register
// clk    (input)  - Clock (positive edge-sensitive)
// enable (input)  - Load new value? (yes = 1, no = 0)
// reset  (input)  - Asynchronous reset    (reset = 1)
//
module register(q, d, clk, enable, reset);

    parameter
        width = 32,
        reset_value = 0;

    output [(width-1):0] q;
    reg    [(width-1):0] q;
    input  [(width-1):0] d;
    input                clk, enable, reset;

    always@(reset)
      if (reset == 1'b1)
        q <= reset_value;

    always@(posedge clk)
      if ((reset == 1'b0) && (enable == 1'b1))
        q <= d;

endmodule // register

module decoder2 (out, in, enable);
    input     in;
    input     enable;
    output [1:0] out;

    and a0(out[0], enable, ~in);
    and a1(out[1], enable, in);
endmodule // decoder2

module decoder4 (out, in, enable);
    input [1:0]    in;
    input     enable;
    output [3:0]   out;
    wire [1:0]    w_enable;

    decoder2 d0(w_enable[1:0],in[1],enable);
    decoder2 d1(out[1:0],in[0],w_enable[0]);
    decoder2 d2(out[3:2],in[0],w_enable[1]);

    // implement using decoder2's

endmodule // decoder4

module decoder8 (out, in, enable);
    input [2:0]    in;
    input     enable;
    output [7:0]   out;
    wire [1:0]    w_enable;

    decoder2 d5(w_enable[1:0],in[2],enable);
    decoder4 d3(out[3:0],in[1:0],w_enable[0]);
    decoder4 d4(out[7:4],in[1:0],w_enable[1]);


    // implement using decoder2's and decoder4's

endmodule // decoder8

module decoder16 (out, in, enable);
    input [3:0]    in;
    input     enable;
    output [15:0]  out;
    wire [1:0]    w_enable;

    decoder2 d6(w_enable[1:0],in[3],enable);
    decoder8 d7(out[7:0],in[2:0],w_enable[0]);
    decoder8 d8(out[15:8],in[2:0],w_enable[1]);

    // implement using decoder2's and decoder8's

endmodule // decoder16

module decoder32 (out, in, enable);
    input [4:0]    in;
    input     enable;
    output [31:0]  out;
    wire [1:0]    w_enable;

    decoder2 d9(w_enable[1:0],in[4],enable);
    decoder16 d10(out[15:0],in[3:0],w_enable[0]);
    decoder16 d11(out[31:16],in[3:0],w_enable[1]);

    // implement using decoder2's and decoder16's

endmodule // decoder32

module mips_regfile (rd1_data, rd2_data, rd1_regnum, rd2_regnum,
             wr_regnum, wr_data, writeenable,
             clock, reset);

    output [31:0]  rd1_data, rd2_data;
    input   [4:0]  rd1_regnum, rd2_regnum, wr_regnum;
    input  [31:0]  wr_data;
    input          writeenable, clock, reset;
    wire  [31:0]a;
    wire [31:0]data[0:31];

    assign data[0] =0;
    decoder32 d321312(a,wr_regnum, writeenable);
    register r1(data[1],wr_data,clock,a[1],reset);
    register r2(data[2], wr_data, clock,a[2],reset);
   register r3(data[3], wr_data, clock,a[3],reset);
   register r4(data[4], wr_data, clock,a[4],reset);
   register r5(data[5], wr_data, clock,a[5],reset);
   register r6(data[6], wr_data, clock,a[6],reset);
   register r7(data[7], wr_data, clock,a[7],reset);
   register r8(data[8], wr_data, clock,a[8],reset);
   register r9(data[9], wr_data, clock,a[9],reset);
   register r10(data[10], wr_data, clock,a[10],reset);
   register r11(data[11], wr_data, clock,a[11],reset);
   register r12(data[12], wr_data, clock,a[12],reset);
   register r13(data[13], wr_data, clock,a[13],reset);
   register r14(data[14], wr_data, clock,a[14],reset);
   register r15(data[15], wr_data, clock,a[15],reset);
   register r16(data[16], wr_data, clock,a[16],reset);
   register r17(data[17], wr_data, clock,a[17],reset);
   register r18(data[18], wr_data, clock,a[18],reset);
   register r19(data[19], wr_data, clock,a[19],reset);
   register r20(data[20], wr_data, clock,a[20],reset);
   register r21(data[21], wr_data, clock,a[21],reset);
   register r22(data[22], wr_data, clock,a[22],reset);
   register r23(data[23], wr_data, clock,a[23],reset);
   register r24(data[24], wr_data, clock,a[24],reset);
   register r25(data[25], wr_data, clock,a[25],reset);
   register r26(data[26], wr_data, clock,a[26],reset);
   register r27(data[27], wr_data, clock,a[27],reset);
   register r28(data[28], wr_data, clock,a[28],reset);
   register r29(data[29], wr_data, clock,a[29],reset);
   register r30(data[30], wr_data, clock,a[30],reset);
   register r31(data[31], wr_data, clock,a[31],reset);

  mux32v m1(rd1_data,data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7],data[8],data[9],data[10],data[11],data[12],data[13],data[14],data[15],data[16],data[17],data[18],data[19],data[20],data[21],data[22],data[23],data[24],data[25],data[26],data[27],data[28],data[29],data[30],data[31],rd1_regnum);
  mux32v m2(rd2_data,data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7],data[8],data[9],data[10],data[11],data[12],data[13],data[14],data[15],data[16],data[17],data[18],data[19],data[20],data[21],data[22],data[23],data[24],data[25],data[26],data[27],data[28],data[29],data[30],data[31],rd2_regnum);

    // build a register file!

endmodule // mips_regfile
