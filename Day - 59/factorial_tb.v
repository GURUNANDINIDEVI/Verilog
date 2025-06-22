//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_factorial;

    parameter WIDTH = 8;

    reg [WIDTH-1:0] number;
    wire [31:0] result;

    // Instantiate factorial module
    factorial #(WIDTH) dut (
        .number(number),
        .result(result)
    );

    integer i;

    initial begin
        $display("Number\tFactorial");

        for (i = 0; i <= 10; i = i + 1) begin
            number = i;
            #5;
            $display("%0d\t%0d", number, result);
        end

        #10 $finish;
    end

endmodule
