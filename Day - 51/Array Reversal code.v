//T. Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module reverse_array #(
    parameter N = 5,
    parameter WIDTH = 8
)(
    input  [WIDTH-1:0] in_array [0:N-1],
    output [WIDTH-1:0] out_array [0:N-1]
);

    integer i;

    always @(*) begin
        for (i = 0; i < N; i = i + 1) begin
            out_array[i] = in_array[N-1 - i];
        end
    end

endmodule
