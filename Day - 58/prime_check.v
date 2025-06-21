//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module prime_check #(
    parameter WIDTH = 8
)(
    input [WIDTH-1:0] number,
    output reg is_prime
);

    integer i;

    always @(*) begin
        if (number <= 1)
            is_prime = 0;
        else begin
            is_prime = 1;  // Assume prime initially
            for (i = 2; i <= number / 2; i = i + 1) begin
                if (number % i == 0)
                    is_prime = 0;
            end
        end
    end

endmodule
