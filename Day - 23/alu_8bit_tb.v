//T.Guru Nandini devi
//nandinidevitekumudi@gmail.com
module tb_alu_8bit;
    reg [7:0] a, b;
    reg [1:0] sel;
    wire [7:0] result;
    wire carry_out;
    // Instantiate the ALU
    alu_8bit u1(.a(a),.b(b),.sel(sel),.result(result),.carry_out(carry_out));
    // Waveform dump
    initial begin
        $dumpfile("alu_8bit.vcd");
        $dumpvars(0, tb_alu_8bit);

        $display("Time\ta\t\tb\t\tsel\tresult\tcarry_out");
        $monitor("%0dns\t%b\t%b\t%02b\t%b\t%b", $time, a, b, sel, result, carry_out);
    end
    initial begin
        // Apply inputs
        a = 8'b00001111; b = 8'b00000011; sel = 2'b00; #10; // AND
        a = 8'b00001111; b = 8'b00000011; sel = 2'b01; #10; // OR
        a = 8'b11110000; b = 8'b00001111; sel = 2'b10; #10; // ADD (Overflow not expected)
        a = 8'b00010000; b = 8'b00000001; sel = 2'b10; #10; // ADD
        a = 8'b00010000; b = 8'b00000100; sel = 2'b11; #10; // SUB
        a = 8'b00000011; b = 8'b00000100; sel = 2'b11; #10; // SUB with borrow
        $finish;
    end
endmodule
