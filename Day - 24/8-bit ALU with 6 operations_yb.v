//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_alu;

    reg [7:0] A, B;
    reg [2:0] sel;
    wire [7:0] result;
    wire carry_out;

    // Instantiate ALU
    alu u1(.A(A),.B(B),.sel(sel),.result(result),.carry_out(carry_out));
    initial begin
        $dumpfile("alu_wave.vcd");
        $dumpvars(0, tb_alu);
    end
    initial begin
        $display("Time\tA\t\tB\t\tSel\tResult\tCarry");
        $monitor("%0dns\t%b\t%b\t%03b\t%b\t%b", $time, A, B, sel, result, carry_out);

        A = 8'b00001111; B = 8'b00000001; sel = 3'b000; #10; // ADD
        A = 8'b00010000; B = 8'b00000010; sel = 3'b001; #10; // SUB
        A = 8'b10101010; B = 8'b11001100; sel = 3'b010; #10; // AND
        A = 8'b10101010; B = 8'b11001100; sel = 3'b011; #10; // OR
        A = 8'b10101010; B = 8'b11001100; sel = 3'b100; #10; // XOR
        A = 8'b10101010; B = 8'bxxxxxxxx; sel = 3'b101; #10; // NOT A

        $finish;
    end

endmodule
