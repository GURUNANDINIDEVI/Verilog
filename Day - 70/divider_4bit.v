//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module divider_4bit (
    input  [3:0] dividend,
    input  [3:0] divisor,
    output reg [3:0] quotient,
    output reg [3:0] remainder
);

    always @(*) begin
        if (divisor == 0) begin
            quotient  = 4'b0000;  // Avoid division by zero
            remainder = 4'b0000;
        end else begin
            quotient  = dividend / divisor;
            remainder = dividend % divisor;
        end
    end

endmodule

