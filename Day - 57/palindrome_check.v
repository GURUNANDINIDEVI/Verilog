//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module palindrome_check #(
    parameter WIDTH = 16  // Adjust as needed
)(
    input [WIDTH-1:0] number,
    output reg is_palindrome
);

    integer temp, reverse, digit, original;

    always @(*) begin
        temp = number;
        original = number;
        reverse = 0;

        while (temp > 0) begin
            digit = temp % 10;
            reverse = (reverse * 10) + digit;
            temp = temp / 10;
        end

        is_palindrome = (original == reverse);
    end

endmodule
