//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps
module tb_fibonacci;
    parameter WIDTH = 8;

    reg [WIDTH-1:0] n;
    wire [31:0] fib;

    // Instantiate Fibonacci module
    fibonacci #(WIDTH) dut (
        .n(n),
        .fib(fib)
    );

    integer i;

    initial begin
        $display("n\tFibonacci(n)");
        for (i = 0; i <= 12; i = i + 1) begin
            n = i;
            #5;
            $display("%0d\t%0d", n, fib);
        end
        #10 $finish;
    end

endmodule
