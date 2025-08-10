//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module d_flipflop (
    input D, clk,
    output reg Q
);
    always @(posedge clk)
        Q <= D;
endmodule

module sr_using_d (
    input S, R, clk,
    output Q
);
    wire D;
    reg Q_int;  // Internal storage for current state

    // D equation: S + (~R & Q)
    assign D = S | (~R & Q_int);

    // Instantiate D FF
    d_flipflop dff1 (.D(D), .clk(clk), .Q(Q_int));

    assign Q = Q_int;
endmodule
