module keypad(valid, number, a, b, c, d, e, f, g);
   output 	valid;
   output [3:0] number;
   input 	a, b, c, d, e, f, g;
   wire N11,N12,N13,N14,N15,N21,N22,N23,N24,N31,N32,N33,N34,N41,N42;
   or out(valid,a,b,c,d,e,f,g);
   and n1(N11,a,d);
   and n11(N12,c,d);
   and n12(N13,b,e);
   and n13(N14,a,f);
   and n14(N15,c,f);

    or res(number[0],N11,N12,N13,N14,N15);

   and n2(N21,d,b);
   and n21(N22,e,c);



   or ress(number[1],N21,N22,N14,N12);


   and n3(N31,a,e);




   or o3(number[2],N31,N13,N22,N14);

   and n4(N41,b,f);


   or o4(number[3],N41,N15);

endmodule // keypad
