//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module d_ff (
    input clk, D,
    output reg Q
);
    always @(posedge clk)
        Q <= D;
endmodule

module sr_using_dff (
    input clk, S, R,
    output Q
);
    wire D;

    assign D = (S | (~R & Q)); // Logic to convert S, R into D

    d_ff d1 (.clk(clk), .D(D), .Q(Q));
endmodule
