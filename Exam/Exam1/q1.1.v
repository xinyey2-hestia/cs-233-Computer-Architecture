// Design a circuit that compares two two-bit unsigned
// inputs (first and second) using the following rules:

// - If the two inputs are equal, then the output is 00
// - If the first input is greater, then the output is 01
// - If the second input is greater, then the output is 10

module comparator(out, first, second);
   output [1:0] out;
   input  [1:0] first, second;



wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16;

and a1(w1,~first[1],~first[0],~second[1],~second[0]);
and a2(w2,~first[1],~first[0],~second[1],second[0]);
and a3(w3,~first[1],~first[0],second[1],~second[0]);
and a4(w4,~first[1],~first[0],second[1],second[0]);
and a5(w5,~first[1],first[0],~second[1],~second[0]);
and a6(w6,~first[1],first[0],~second[1],second[0]);
and a7(w7,~first[1],first[0],second[1],~second[0]);
and a8(w8,~first[1],first[0],second[1],second[0]);
and a9(w9,first[1],~first[0],~second[1],~second[0]);
and a10(w10,first[1],~first[0],~second[1],second[0]);
and a11(w11,first[1],~first[0],second[1],~second[0]);
and a12(w12,first[1],~first[0],second[1],second[0]);
and a13(w13,first[1],first[0],~second[1],~second[0]);
and a14(w14,first[1],first[0],~second[1],second[0]);
and a15(w15,first[1],first[0],second[1],~second[0]);
and a16(w16,first[1],first[0],second[1],second[0]);

or o1(out[0],w5,w9,w10,w13,w14,w15);
or o2(out[1],w2,w3,w4,w7,w8,w12);
endmodule // comparator
