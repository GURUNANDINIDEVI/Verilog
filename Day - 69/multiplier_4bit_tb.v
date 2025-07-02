//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_multiplier_4bit;

    reg  [3:0] a, b;
    wire [7:0] product;

    // Instantiate the multiplier
    multiplier_4bit dut (
        .a(a),
        .b(b),
        .product(product)
    );

    initial begin
        $display("A     B     -> Product");

        a = 4'd3; b = 4'd2; #10;
        $display("%d     %d     -> %d", a, b, product);

        a = 4'd7; b = 4'd5; #10;
        $display("%d     %d     -> %d", a, b, product);

        a = 4'd15; b = 4'd15; #10;
        $display("%d     %d     -> %d", a, b, product);

        a = 4'd8; b = 4'd4; #10;
        $display("%d     %d     -> %d", a, b, product);

        #10 $finish;
    end

endmodule
