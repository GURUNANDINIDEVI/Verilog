//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
// D Flip-Flop with asynchronous reset (active high)
module d_ff (
    input  clk,
    input  reset, // active-high asynchronous reset
    input  D,
    output reg Q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 1'b0;
        else
            Q <= D;
    end
endmodule

// JK implemented using D flip-flop
module jk_using_d (
    input  clk,
    input  reset,
    input  J,
    input  K,
    output Q
);
    wire D;
    wire Q_int;

    // JK -> D conversion: D = J*~Q + ~K*Q
    assign D = (J & ~Q_int) | (~K & Q_int);

    d_ff d1 (.clk(clk), .reset(reset), .D(D), .Q(Q_int));

    assign Q = Q_int;
endmodule
