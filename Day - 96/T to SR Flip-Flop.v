//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module sr_ff (
    input clk, S, R,
    output reg Q
);
    always @(posedge clk) begin
        case ({S, R})
            2'b00: Q <= Q;     // Hold
            2'b01: Q <= 0;     // Reset
            2'b10: Q <= 1;     // Set
            2'b11: Q <= 1'bx;  // Invalid
        endcase
    end
endmodule

module t_using_sr (
    input clk, T,
    output Q
);
    wire S, R;

    assign S = T & ~Q;
    assign R = T & Q;

    sr_ff sr1 (.clk(clk), .S(S), .R(R), .Q(Q));
endmodule
