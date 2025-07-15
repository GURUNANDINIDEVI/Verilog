//T.Guru Nandini Devi
//nandinitekumudi@gmail.com
`timescale 1ns/1ps

module tb_subtractor_4bit;

    reg  [3:0] a, b;
    wire [3:0] diff;
    wire       borrow_out;

    subtractor_4bit uut (
        .a(a), .b(b),
        .diff(diff), .borrow_out(borrow_out)
    );

    initial begin
        $dumpfile("subtractor_waveform.vcd");
        $dumpvars(0, tb_subtractor_4bit);

        $display(" A    B   |  Diff Borrow");
        $monitor("%b  %b  |  %b     %b", a, b, diff, borrow_out);

        a = 4'b0110; b = 4'b0011; #10;  // 6 - 3 = 3
        a = 4'b0100; b = 4'b0110; #10;  // 4 - 6 = -2 (in 2's comp)
        a = 4'b1111; b = 4'b1111; #10;  // 15 - 15 = 0
        a = 4'b1000; b = 4'b0001; #10;  // 8 - 1 = 7
        a = 4'b0000; b = 4'b0001; #10;  // 0 - 1 = -1

        $finish;
    end

endmodule
