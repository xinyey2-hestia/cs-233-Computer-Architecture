module timer(TimerInterrupt, TimerAddress, cycle,
             address, data, MemRead, MemWrite, clock, reset);
    output        TimerInterrupt, TimerAddress;
    output [31:0] cycle;
    input  [31:0] address, data;
    input         MemRead, MemWrite, clock, reset;

    // complete the timer circuit here

    // HINT: make your interrupt cycle register reset to 32'hffffffff
    //       (using the reset_value parameter)
    //       to prevent an interrupt being raised the very first cycle
    //assign cycle = 32'hffffffff

    wire[31:0] q,d,Q;
    wire TimerWrite,intptenable,TimerRead,intreset,Acknowledge,gettime,storetime;

    //assign q =32'hffffffff;
    // Dealing with address stuff
    assign gettime = address==32'hffff001c;
    assign storetime =  address==32'hffff006c;
    and a1(TimerRead,MemRead,gettime);
    and a2(TimerWrite,MemWrite,gettime);
    and a6(Acknowledge,storetime,MemWrite);
    or o86(TimerAddress,storetime,gettime);


    or o1(intreset,reset,Acknowledge);
    //begin with interupt cycle

    register #(32,32'hffffffff) interupt(Q,data,clock,TimerWrite,reset);
    

    alu32 plus1(d, , ,3'h0,q,32'b1);
    register cyclecounter(q, d, clock, 1'b1, reset);

    assign intptenable = Q==q;

    tristate cycleout(cycle,q,TimerRead);

    // interupt line
    register #(1) interuptline(TimerInterrupt,1'b1,clock,intptenable,intreset);

endmodule
