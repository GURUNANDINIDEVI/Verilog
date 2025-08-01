//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_ripple_carry_adder;

    reg  [3:0] a, b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;

    ripple_carry_adder uut (
        .a(a), .b(b), .cin(cin),
        .sum(sum), .cout(cout)
    );

    initial begin
        $dumpfile("ripple_carry_waveform.vcd");
        $dumpvars(0, tb_ripple_carry_adder);

        $display("A     B     Cin | Sum   Cout");
        $monitor("%b  %b   %b   | %b    %b", a, b, cin, sum, cout);

        // Test various cases
        a = 4'b0001; b = 4'b0010; cin = 0; #10;
        a = 4'b0101; b = 4'b0011; cin = 0; #10;
        a = 4'b1111; b = 4'b0001; cin = 0; #10;
        a = 4'b1010; b = 4'b0101; cin = 1; #10;
        a = 4'b1111; b = 4'b1111; cin = 1; #10;

        $finish;
    end

endmodule
