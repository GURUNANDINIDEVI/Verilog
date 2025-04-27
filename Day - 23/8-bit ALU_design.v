//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module alu_8bit (
    input  [7:0] a,
    input  [7:0] b,
    input  [1:0] sel,        // Operation selector
    output reg [7:0] result,
    output reg carry_out     // Carry out for ADD, Borrow out for SUB
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
                {carry_out, result} = a - b; // SUB with borrow 
            end
            default: begin
                result = 8'b0;
                carry_out = 0;
            end
        endcase
    end
endmodule
