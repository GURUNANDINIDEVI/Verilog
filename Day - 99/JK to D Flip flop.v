//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module jk_ff (
    input clk, J, K,
    output reg Q
);
    always @(posedge clk)
        case ({J, K})
            2'b00: Q <= Q;       // No change
            2'b01: Q <= 0;       // Reset
            2'b10: Q <= 1;       // Set
            2'b11: Q <= ~Q;      // Toggle
        endcase
endmodule

module d_using_jk (
    input clk, D,
    output Q
);
    wire J, K;

    assign J = D & ~Q;
    assign K = ~D & Q;

    jk_ff jk1 (.clk(clk), .J(J), .K(K), .Q(Q));
endmodule
