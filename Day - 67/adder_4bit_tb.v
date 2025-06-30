//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_adder_4bit;

    reg  [3:0] a, b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;

    // Instantiate the adder
    adder_4bit dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $display("A     B     Cin -> Sum   Cout");

        a = 4'b0001; b = 4'b0010; cin = 0; #10;
        $display("%b  %b   %b   -> %b   %b", a, b, cin, sum, cout);

        a = 4'b1111; b = 4'b0001; cin = 0; #10;
        $display("%b  %b   %b   -> %b   %b", a, b, cin, sum, cout);

        a = 4'b1001; b = 4'b1001; cin = 1; #10;
        $display("%b  %b   %b   -> %b   %b", a, b, cin, sum, cout);

        a = 4'b0101; b = 4'b0110; cin = 0; #10;
        $display("%b  %b   %b   -> %b   %b", a, b, cin, sum, cout);

        #10 $finish;
    end

endmodule
