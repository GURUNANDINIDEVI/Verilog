//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module bit_reverse #(
    parameter WIDTH = 8
)(
    input  [WIDTH-1:0] in_vector,
    output reg [WIDTH-1:0] out_vector
);

    integer i;

    always @(*) begin
        for (i = 0; i < WIDTH; i = i + 1) begin
            out_vector[i] = in_vector[WIDTH - 1 - i];
        end
    end

endmodule
