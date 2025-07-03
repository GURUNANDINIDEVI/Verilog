//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_divider_4bit;

    reg  [3:0] dividend, divisor;
    wire [3:0] quotient, remainder;

    // Instantiate the divider
    divider_4bit dut (
        .dividend(dividend),
        .divisor(divisor),
        .quotient(quotient),
        .remainder(remainder)
    );

    initial begin
        $display("Dividend  Divisor  -> Quotient  Remainder");

        dividend = 4'd8; divisor = 4'd2; #10;
        $display("   %d        %d      ->    %d         %d", dividend, divisor, quotient, remainder);

        dividend = 4'd15; divisor = 4'd4; #10;
        $display("   %d       %d      ->    %d         %d", dividend, divisor, quotient, remainder);

        dividend = 4'd7; divisor = 4'd3; #10;
        $display("   %d        %d      ->    %d         %d", dividend, divisor, quotient, remainder);

        dividend = 4'd9; divisor = 4'd0; #10;
        $display("   %d        %d      ->    %d         %d", dividend, divisor, quotient, remainder);  // Division by zero case

        #10 $finish;
    end

endmodule
