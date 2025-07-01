//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_subtractor_4bit;

    reg  [3:0] a, b;
    wire [3:0] diff;
    wire       borrow;

    // Instantiate the subtractor
    subtractor_4bit dut (
        .a(a),
        .b(b),
        .diff(diff),
        .borrow(borrow)
    );

    initial begin
        $display("A     B     -> Diff  Borrow");

        a = 4'b1001; b = 4'b0011; #10;  // 9 - 3 = 6
        $display("%b  %b  -> %b    %b", a, b, diff, borrow);

        a = 4'b0110; b = 4'b0110; #10;  // 6 - 6 = 0
        $display("%b  %b  -> %b    %b", a, b, diff, borrow);

        a = 4'b0101; b = 4'b1010; #10;  // 5 - 10 = -5 (wrapped, borrow = 1)
        $display("%b  %b  -> %b    %b", a, b, diff, borrow);

        a = 4'b0000; b = 4'b0001; #10;  // 0 - 1 = -1 (wrapped)
        $display("%b  %b  -> %b    %b", a, b, diff, borrow);

        #10 $finish;
    end

endmodule
