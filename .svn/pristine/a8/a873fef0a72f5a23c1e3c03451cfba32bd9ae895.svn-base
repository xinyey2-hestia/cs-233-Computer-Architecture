module gcd_control(done, x_sel, y_sel, x_en, y_en, output_en, go, x_lt_y, x_ne_y, clock, reset);
	output	x_sel, y_sel, x_en, y_en, output_en, done;
	input	go, x_lt_y, x_ne_y;
	input	clock , reset;

	// IMPLEMENT YOUR STATE MACHINE HERE

	wire  garb_next,equal_next,compare_next,y_next,x_next,sdone_next,garb,equal,compare,y,x,sdone,equal_next0,compare_next0,y_next0,x_next0,sdone_next0,equal0,compare0,y0,x0,sdone0,in,in_next;


	assign garb_next = (garb&~go)|((equal0|compare0|x0|y0|sdone0)&go) |reset;
	assign in_next = garb&go&(~reset);


	assign equal_next = (in|x|y)& go & (~reset);
	assign compare_next = equal & x_ne_y &go & (~reset);
	assign y_next = compare & x_lt_y&go &(~reset);
	assign x_next = compare & (~x_lt_y) & go & (~reset);
	assign sdone_next=((equal&(~x_ne_y))|sdone) & go & (~reset);

	//go =0

	assign equal_next0= (in|x0|y0) & (~go) & (~reset);
	assign compare_next0 = ((equal0&x_ne_y)|compare)&(~go)&(~reset);
	assign y_next0= ((compare0&x_lt_y)|y)&(~go)&(~reset);
	assign x_next0 = ((compare0&(~x_lt_y))|x)&(~go)&(~reset);
	assign sdone_next0 = ((equal0 & (~x_lt_y))|sdone|sdone0)&(~go) &(~reset);

	dffe g1(garb,garb_next,clock,1'b1,1'b0);
	dffe i1(in,in_next,clock,1'b1,1'b0);

	dffe fe(equal,equal_next,clock,1'b1,1'b0);
	dffe fc(compare,compare_next,clock,1'b1,1'b0);
	dffe fuy(y,y_next,clock,1'b1,1'b0);
	dffe fux(x,x_next,clock,1'b1,1'b0);
	dffe fdone(sdone,sdone_next,clock,1'b1,1'b0);

	//go =0

	dffe fe0(equal0,equal_next0,clock,1'b1,1'b0);
	dffe fc0(compare0,compare_next0,clock,1'b1,1'b0);
	dffe fuy0(y0,y_next0,clock,1'b1,1'b0);
	dffe fux0(x0,x_next0,clock,1'b1,1'b0);
	dffe fd0(sdone0,sdone_next0,clock,1'b1,1'b0);

	assign x_sel = ~in;
	assign x_en = (x|in|x0)&(~sdone);
	assign y_sel = ~in;
	assign y_en = (y|in|y0)&(~sdone);
	assign output_en = ~sdone|~sdone0;
	assign done = sdone|sdone;


endmodule //GCD_control
