//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module sr_flipflop (
    input S, R, clk,
    output reg Q
);
    always @(posedge clk) begin
        case ({S, R})
            2'b00: Q <= Q;       // No change
            2'b01: Q <= 0;       // Reset
            2'b10: Q <= 1;       // Set
            2'b11: Q <= 1'bx;    // Invalid
        endcase
    end
endmodule

module d_flipflop_using_sr (
    input D, clk,
    output Q
);
    wire S, R;
    assign S = D;
    assign R = ~D;

    sr_flipflop sr1 (
        .S(S),
        .R(R),
        .clk(clk),
        .Q(Q)
    );
endmodule
