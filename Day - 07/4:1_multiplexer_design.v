module mux4to1 (
    input  wire [1:0] sel,   // 2-bit select input
    input  wire [3:0] d,     // 4-bit data inputs
    output reg  y           // Output (reg because we use an always block)
);

    always @(*) begin
        case (sel)
            2'b00: y = d[0];
            2'b01: y = d[1];
            2'b10: y = d[2];
            2'b11: y = d[3];
            default: y = 1'b0; // Default case to avoid latches
        endcase
    end

endmodule
