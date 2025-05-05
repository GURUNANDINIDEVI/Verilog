//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module alu (
    input [7:0] A,
    input [7:0] B,
    input [2:0] sel,          // Selects the operation
    output reg [7:0] result,
    output reg carry_out
);

    always @(*) begin
        case (sel)
            3'b000: {carry_out, result} = A + B;   // ADD
            3'b001: {carry_out, result} = A - B;   // SUB
            3'b010: begin
                result = A & B; carry_out = 0;     // AND
            end
            3'b011: begin
                result = A | B; carry_out = 0;     // OR
            end
            3'b100: begin
                result = A ^ B; carry_out = 0;     // XOR
            end
            3'b101: begin
                result = ~A; carry_out = 0;        // NOT A
            end
            default: begin
                result = 8'b00000000; carry_out = 0;
            end
        endcase
    end

endmodule
