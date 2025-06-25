//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_bit_reverse;

    parameter WIDTH = 8;

    reg  [WIDTH-1:0] in_vector;
    wire [WIDTH-1:0] out_vector;

    // Instantiate the bit_reverse module
    bit_reverse #(WIDTH) dut (
        .in_vector(in_vector),
        .out_vector(out_vector)
    );

    initial begin
        $display("Input     -> Bit-Reversed Output");

        in_vector = 8'b00011010; #5;
        $display("%b -> %b", in_vector, out_vector);

        in_vector = 8'b10101010; #5;
        $display("%b -> %b", in_vector, out_vector);

        in_vector = 8'b11110000; #5;
        $display("%b -> %b", in_vector, out_vector);

        in_vector = 8'b10000001; #5;
        $display("%b -> %b", in_vector, out_vector);

        in_vector = 8'b00000001; #5;
        $display("%b -> %b", in_vector, out_vector);

        #10 $finish;
    end

endmodule
