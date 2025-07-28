//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module d_ff (
    input clk, D,
    output reg Q
);
    always @(posedge clk)
        Q <= D;
endmodule

module jk_using_d (
    input clk, J, K,
    output Q
);
    wire D;

    assign D = (J & ~Q) | (~K & Q);  // D logic derived from JK

    d_ff d1 (.clk(clk), .D(D), .Q(Q));
endmodule
