//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module find_max_min #(
    parameter N = 5,
    parameter WIDTH = 8
)(
    input [WIDTH-1:0] in_array [0:N-1],
    output reg [WIDTH-1:0] max_val,
    output reg [WIDTH-1:0] min_val
);

    integer i;

    always @(*) begin
        max_val = in_array[0];
        min_val = in_array[0];
        for (i = 1; i < N; i = i + 1) begin
            if (in_array[i] > max_val)
                max_val = in_array[i];
            if (in_array[i] < min_val)
                min_val = in_array[i];
        end
    end

endmodule
