//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_gcd;

    parameter WIDTH = 8;

    reg  [WIDTH-1:0] a, b;
    wire [WIDTH-1:0] result;

    // Instantiate the GCD module
    gcd #(WIDTH) dut (
        .a(a),
        .b(b),
        .result(result)
    );

    initial begin
        $display("a\tb\tGCD");

        a = 48; b = 18; #10 $display("%0d\t%0d\t%0d", a, b, result);
        a = 24; b = 36; #10 $display("%0d\t%0d\t%0d", a, b, result);
        a = 17; b = 13; #10 $display("%0d\t%0d\t%0d", a, b, result);
        a = 100; b = 25; #10 $display("%0d\t%0d\t%0d", a, b, result);
        a = 81; b = 27; #10 $display("%0d\t%0d\t%0d", a, b, result);

        #10 $finish;
    end

endmodule
