//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_full_adder_using_half_adders;

    reg a, b, cin;
    wire sum, cout;

    // Instantiate the Full Adder
    full_adder_using_half_adders uut (
        .a(a), .b(b), .cin(cin),
        .sum(sum), .cout(cout)
    );

    initial begin
        // Enable waveform dump
        $dumpfile("full_adder_waveform.vcd");  // VCD file name
        $dumpvars(0, tb_full_adder_using_half_adders); // Dump everything in this module

        // Test all combinations
        $display("A B Cin | Sum Cout");
        for (integer i = 0; i < 8; i = i + 1) begin
            {a, b, cin} = i[2:0];
            #5 $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);
        end

        #5 $finish;
    end

endmodule
