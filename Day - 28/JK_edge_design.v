//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
// jk_flipflop.v
module jk_flipflop (
    input wire clk,
    input wire reset,
    input wire J,
    input wire K,
    output reg Q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 0;
        else begin
            case ({J, K})
                2'b00: Q <= Q;       // No change
                2'b01: Q <= 0;       // Reset
                2'b10: Q <= 1;       // Set
                2'b11: Q <= ~Q;      // Toggle
            endcase
        end
    end
endmodule
