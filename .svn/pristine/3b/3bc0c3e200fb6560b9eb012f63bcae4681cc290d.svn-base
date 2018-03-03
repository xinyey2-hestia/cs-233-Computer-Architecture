module blackbox_test;

reg e_in, u_in, a_in;
wire x_out;
blackbox bx(x_out, e_in, u_in, a_in);


initial begin
     $dumpfile("blackbox.vcd");
     $dumpvars(0,blackbox_test);


     e_in =0; u_in = 0; a_in =0; #10;
     e_in =0; u_in = 0; a_in =1; #10;
     e_in =0; u_in = 1; a_in =0; #10;
     e_in =0; u_in = 1; a_in =1; #10;
     e_in =1; u_in = 0; a_in =0; #10;
     e_in =1; u_in = 0; a_in =1; #10;
     e_in =1; u_in = 1; a_in =0; #10;
     e_in =1; u_in = 1; a_in =1; #10;

     $finish;

end

initial
$monitor("At time %2t, e_in = %d u_in = %d a_in = %d x_out = %d",
         $time, e_in, u_in, a_in, x_out);





endmodule // blackbox_test
