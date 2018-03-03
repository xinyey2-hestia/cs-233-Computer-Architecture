// Complete the sc2_block module in this file
// Don't put any code in this file besides the sc2_block

module sc2_block(s, cout, a, b, cin);
output s, cout;
input  a, b, cin;
wire   w1, w2, w3, w4;

sc_block s1(w1,w2,a,b);
sc_block s2(s,w4,w1,cin);
or(cout,w2,w4);
endmodule // sc2_block
