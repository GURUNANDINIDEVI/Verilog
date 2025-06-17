//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module selection_sort #(
    parameter N = 5,
    parameter WIDTH = 8
)(
    input  [WIDTH-1:0] in_array [0:N-1],
    output reg [WIDTH-1:0] out_array [0:N-1]
);

    integer i, j, min_idx;
    reg [WIDTH-1:0] temp;

    always @(*) begin
        // Initialize output array with input array first
        for (i = 0; i < N; i = i + 1) begin
            out_array[i] = in_array[i];
        end

        // Perform Selection Sort
        for (i = 0; i < N-1; i = i + 1) begin
            min_idx = i;
            for (j = i+1; j < N; j = j + 1) begin
                if (out_array[j] < out_array[min_idx]) begin
                    min_idx = j;
                end
            end
            if (min_idx != i) begin
                temp = out_array[i];
                out_array[i] = out_array[min_idx];
                out_array[min_idx] = temp;
            end
        end
    end
endmodule
