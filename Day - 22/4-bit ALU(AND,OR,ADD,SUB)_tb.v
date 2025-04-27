//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_alu;

    reg [3:0] a, b;
    reg [1:0] sel;
    wire [3:0] result;
    wire carry_out;

    alu u1(.a(a),.b(b),.sel(sel),.result(result),.carry_out(carry_out));

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, tb_alu);

        $display("Time\ta\tb\tsel\tresult\tcarry_out");
        $monitor("%0dns\t%b\t%b\t%02b\t%b\t%b", $time, a, b, sel, result, carry_out);

        a = 4'b0101; b = 4'b0011; sel = 2'b00; #10; // AND
        a = 4'b0101; b = 4'b0011; sel = 2'b01; #10; // OR
        a = 4'b1111; b = 4'b0001; sel = 2'b10; #10; // ADD (15 + 1 = 16, overflow)
        a = 4'b0101; b = 4'b0011; sel = 2'b11; #10; // SUB (5 - 3 = 2)

        $finish;
    end

endmodule
