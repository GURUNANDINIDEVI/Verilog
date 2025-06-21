//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_prime_check;

    parameter WIDTH = 8;

    reg [WIDTH-1:0] number;
    wire is_prime;

    // Instantiate the prime_check module
    prime_check #(WIDTH) dut (
        .number(number),
        .is_prime(is_prime)
    );

    integer i;

    initial begin
        // Test numbers from 0 to 20
        for (i = 0; i <= 20; i = i + 1) begin
            number = i;
            #5;
            $display("Number: %0d => Prime: %b", number, is_prime);
        end

        #10 $finish;
    end

endmodule
