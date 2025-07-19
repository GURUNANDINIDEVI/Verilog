//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_alu_4bit_mux;
    reg  [3:0] A, B;
    reg  [2:0] sel;
    wire [3:0] result;
    wire carry_out;

    alu_4bit_mux uut (
        .A(A), .B(B), .sel(sel),
        .result(result), .carry_out(carry_out)
    );

    initial begin
        $display("A     B     sel  | result carry");
        $display("-------------------------------");

        A = 4'b0101; B = 4'b0011; sel = 3'b000; #5;  // ADD
        $display("%b  %b   %b   |  %b     %b", A, B, sel, result, carry_out);

        A = 4'b0110; B = 4'b0011; sel = 3'b001; #5;  // SUB
        $display("%b  %b   %b   |  %b     %b", A, B, sel, result, carry_out);

        A = 4'b1100; B = 4'b1010; sel = 3'b010; #5;  // AND
        $display("%b  %b   %b   |  %b     %b", A, B, sel, result, carry_out);

        A = 4'b1100; B = 4'b1010; sel = 3'b011; #5;  // OR
        $display("%b  %b   %b   |  %b     %b", A, B, sel, result, carry_out);

        A = 4'b1100; B = 4'b1010; sel = 3'b100; #5;  // XOR
        $display("%b  %b   %b   |  %b     %b", A, B, sel, result, carry_out);

        A = 4'b1010; B = 4'b0000; sel = 3'b101; #5;  // NOT A
        $display("%b  %b   %b   |  %b     %b", A, B, sel, result, carry_out);

        A = 4'b1111; B = 4'b0000; sel = 3'b110; #5;  // INC
        $display("%b  %b   %b   |  %b     %b", A, B, sel, result, carry_out);

        A = 4'b0000; B = 4'b0000; sel = 3'b111; #5;  // DEC
        $display("%b  %b   %b   |  %b     %b", A, B, sel, result, carry_out);

        $finish;
    end
endmodule
