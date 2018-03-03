// 00 - AND, 01 - OR, 10 - NOR, 11 - XOR
module logicunit(out, A, B, control);
    output      out;
    input       A, B;
    input [1:0] control;
    wire l1,l2,l3,l4,n_control0,n_control1,w1,w2,w3,w4,f1,f2,o1,o2;
    not n1(n_control0,control[0]);
    not n2(n_control1,control[1]);

    and a1(l1,A,B);
    or o1(l2,A,B);
    nor n1(l3,A,B);
    xor x1(l4,A,B);



    //mux4 m1(out,l1,l2,l3,l4,control);

    and a1(w1, l1, n_control0);// w1->and
    and a2(w2,l2,control[0]); // w2->or
    or ooo1(o1,w1,w2);

    and a3(w3,l3,n_control0);//w3->nor
    and a4(w4,l4,control[0]);//w4->xor
    or ooo2(o2,w3,w4);


    and aa1(f1,o1,n_control1);
    and aa2(f2,o2,control[1]);
    or (out,f1,f2);












endmodule // logicunit
