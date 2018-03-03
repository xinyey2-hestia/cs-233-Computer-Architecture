




// GCD datapath
module gcd_circuit(out, x_lt_y, x_ne_y, X, Y, x_sel, y_sel, x_en, y_en, output_en, clock, reset);
	output  [31:0] out;
	output  x_lt_y, x_ne_y;
	input	[31:0]	X, Y;
	input   x_sel, y_sel, x_en, y_en, output_en, clock, reset;
	wire [31:0] wx1,wx2,wx3,wy1,wy2,wy3;



    // IMPLEMENT gcd_circuit HERE




mux2v m1(wx1,X,wx3,x_sel);
register r1(wx2,wx1,clock,x_en,reset);
subtractor s1(wx3,wx2,wy2);

mux2v m2(wy1,Y,wy3,y_sel);
register r2(wy2,wy1,clock,y_en,reset);
subtractor s2(wy3,wy2,wx2);


comparator c1(x_lt_y,x_ne_y,wx2,wy2);
register r4(out,wx2,clock,output_en,reset);







endmodule // gcd_circuit
