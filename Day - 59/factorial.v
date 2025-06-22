//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module factorial #(
    parameter WIDTH = 8
)(
    input [WIDTH-1:0] number,
    output reg [31:0] result
);

    integer i;

    always @(*) begin
        result = 1;
        for (i = 2; i <= number; i = i + 1) begin
            result = result * i;
        end
    end

endmodule
