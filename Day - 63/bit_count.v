//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module bit_count #(
    parameter WIDTH = 8
)(
    input  [WIDTH-1:0] in_vector,
    output reg [$clog2(WIDTH+1)-1:0] one_count  // Output width = log2(WIDTH+1)
);

    integer i;

    always @(*) begin
        one_count = 0;
        for (i = 0; i < WIDTH; i = i + 1) begin
            if (in_vector[i] == 1'b1)
                one_count = one_count + 1;
        end
    end

endmodule
