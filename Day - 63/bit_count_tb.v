//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_bit_count;

    parameter WIDTH = 8;

    reg  [WIDTH-1:0] in_vector;
    wire [$clog2(WIDTH+1)-1:0] one_count;

    // Instantiate the bit_count module
    bit_count #(WIDTH) dut (
        .in_vector(in_vector),
        .one_count(one_count)
    );

    initial begin
        $display("Input Vector    -> Number of 1s");

        in_vector = 8'b00000000; #5;
        $display("%b -> %0d", in_vector, one_count);

        in_vector = 8'b11111111; #5;
        $display("%b -> %0d", in_vector, one_count);

        in_vector = 8'b10101010; #5;
        $display("%b -> %0d", in_vector, one_count);

        in_vector = 8'b11110000; #5;
        $display("%b -> %0d", in_vector, one_count);

        in_vector = 8'b00001111; #5;
        $display("%b -> %0d", in_vector, one_count);

        in_vector = 8'b10000001; #5;
        $display("%b -> %0d", in_vector, one_count);

        #10 $finish;
    end

endmodule
