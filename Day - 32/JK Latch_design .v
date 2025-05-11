//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module jk_latch (
    input wire J,
    input wire K,
    input wire enable,  // level-sensitive control
    input wire reset,
    output reg Q
);

    always @(*) begin
        if (reset)
            Q = 0;
        else if (enable) begin
            case ({J, K})
                2'b00: Q = Q;       // No change
                2'b01: Q = 0;       // Reset
                2'b10: Q = 1;       // Set
                2'b11: Q = ~Q;      // Toggle
            endcase
        end
    end

endmodule
