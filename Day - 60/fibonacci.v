//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module fibonacci #(
    parameter WIDTH = 8
)(
    input [WIDTH-1:0] n,
    output reg [31:0] fib
);

    integer i;
    reg [31:0] a, b, temp;

    always @(*) begin
        if (n == 0)
            fib = 0;
        else if (n == 1)
            fib = 1;
        else begin
            a = 0;
            b = 1;
            for (i = 2; i <= n; i = i + 1) begin
                temp = b;
                b = a + b;
                a = temp;
            end
            fib = b;
        end
    end

endmodule
