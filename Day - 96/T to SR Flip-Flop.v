//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module sr_ff (
    input S, R, clk,
    output reg Q
);
    initial Q = 0; // start with known value

    always @(posedge clk) begin
        case ({S,R})
            2'b00: Q <= Q;     // Hold
            2'b01: Q <= 0;     // Reset
            2'b10: Q <= 1;     // Set
            2'b11: Q <= 1'bx;  // Invalid
        endcase
    end
endmodule

module t_using_sr (
    input T, clk,
    output Q
);
    wire S, R, Q_int; // Q_int is wire now

    assign S = T & ~Q_int;
    assign R = T &  Q_int;

    // SR FF instance
    sr_ff sr1 (.S(S), .R(R), .clk(clk), .Q(Q_int));

    assign Q = Q_int; // Output mapping
endmodule
