//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module alu_4bit_mux (
    input  [3:0] A, B,
    input  [2:0] sel,
    output reg [3:0] result,
    output reg carry_out
);

    always @(*) begin
        carry_out = 0;
        case (sel)
            3'b000: {carry_out, result} = A + B;         // ADD
            3'b001: {carry_out, result} = A - B;         // SUB
            3'b010: result = A & B;                      // AND
            3'b011: result = A | B;                      // OR
            3'b100: result = A ^ B;                      // XOR
            3'b101: result = ~A;                         // NOT A
            3'b110: {carry_out, result} = A + 4'b0001;   // INC A
            3'b111: {carry_out, result} = A - 4'b0001;   // DEC A
            default: result = 4'b0000;
        endcase
    end
endmodule
