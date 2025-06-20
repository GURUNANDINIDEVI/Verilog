//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_palindrome_check;

    parameter WIDTH = 16;

    reg [WIDTH-1:0] number;
    wire is_palindrome;

    integer i;

    // Instantiate the palindrome check module
    palindrome_check #(WIDTH) dut (
        .number(number),
        .is_palindrome(is_palindrome)
    );

    initial begin
        // Test cases
        for (i = 0; i < 6; i = i + 1) begin
            case (i)
                0: number = 121;
                1: number = 12321;
                2: number = 1001;
                3: number = 123;
                4: number = 45654;
                5: number = 789;
            endcase
            #5;
            $display("Input Number: %0d -> Palindrome: %b", number, is_palindrome);
        end

        #20 $finish;
    end

endmodule
