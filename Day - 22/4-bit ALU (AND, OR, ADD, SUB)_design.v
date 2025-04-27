module alu (
    input  [3:0] a,
    input  [3:0] b,
    input  [1:0] sel,       // Operation selector
    output reg [3:0] result,
    output reg carry_out    // Only meaningful for ADD/SUB
);

    always @(*) begin
        case (sel)
            2'b00: begin
                result = a & b;         // AND
                carry_out = 0;
            end
            2'b01: begin
                result = a | b;         // OR
                carry_out = 0;
            end
            2'b10: begin
                {carry_out, result} = a + b; // ADD with carry
            end
            2'b11: begin
                {carry_out, result} = a - b; // SUB with borrow (treated as carry_out)
            end
        endcase
    end

endmodule
