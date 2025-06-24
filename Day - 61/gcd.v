//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module gcd #(
    parameter WIDTH = 8
)(
    input  [WIDTH-1:0] a,
    input  [WIDTH-1:0] b,
    output reg [WIDTH-1:0] result
);

    reg [WIDTH-1:0] x, y;

    always @(*) begin
        x = a;
        y = b;

        while (y != 0) begin
            if (x > y)
                x = x - y;
            else
                y = y - x;
        end

        result = x;  // x will hold the GCD
    end

endmodule
