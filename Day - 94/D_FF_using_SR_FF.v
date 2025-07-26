//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module sr_ff (
    input clk, S, R,
    output reg Q
);
    always @(posedge clk) begin
        if (S == 1 && R == 0)
            Q <= 1;
        else if (S == 0 && R == 1)
            Q <= 0;
        else if (S == 0 && R == 0)
            Q <= Q;  // Hold
        else
            Q <= 1'bx; // Invalid condition (S=1, R=1)
    end
endmodule

module d_ff_using_sr (
    input clk, D,
    output Q
);
    wire S, R;

    assign S = D;
    assign R = ~D;

    sr_ff sr(.clk(clk), .S(S), .R(R), .Q(Q));
endmodule

