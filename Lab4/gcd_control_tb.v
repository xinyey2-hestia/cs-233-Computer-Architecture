module gcd_control_test;
    reg       clock = 0;
    always #1 clock = !clock;
    reg [31:0] X = 0, Y = 0;
    reg go = 0;
    reg reset = 1;

    initial begin
        $dumpfile("gcd_control.vcd");
        $dumpvars(0, gcd_control_test);
        #1      reset = 0;
        #5      X = 354; Y = 118; go = 1;
        // You may have to change the following # 100 if it isn't
        // enough time for your machine to finish processing.
        #30    go = 0;
        // Add your own testcases here!
       #1       reset =0;
       #5       X =100; Y =20; go =1;

       #50       go = 0;


       #1       reset = 0;

       #5       X=15; Y=15;  go =1;

       #50      go = 0;
       #100

        $finish;
    end

    wire [31:0] out;
	wire done, x_lt_y, x_ne_y, x_sel, y_sel, x_en, y_en, output_en;
    gcd_circuit circuit(out, x_lt_y, x_ne_y, X, Y, x_sel, y_sel, x_en, y_en, output_en, clock, reset);
    gcd_control control(done, x_sel, y_sel, x_en, y_en, output_en, go, x_lt_y, x_ne_y, clock, reset);
endmodule
