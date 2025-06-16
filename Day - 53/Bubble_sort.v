//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module bubble_sort #(
    parameter N = 5,
    parameter WIDTH = 8
)(
    input  [WIDTH-1:0] in_array [0:N-1],
    output reg [WIDTH-1:0] out_array [0:N-1]
);

    integer i, j;
    reg [WIDTH-1:0] temp;

    always @(*) begin
        // Initialize output array with input array first
        for (i = 0; i < N; i = i + 1) begin
            out_array[i] = in_array[i];
        end

        // Perform Bubble Sort
        for (i = 0; i < N-1; i = i + 1) begin
            for (j = 0; j < N-1 - i; j = j + 1) begin
                if (out_array[j] > out_array[j+1]) begin
                    temp = out_array[j];
                    out_array[j] = out_array[j+1];
                    out_array[j+1] = temp;
                end
            end
        end
    end

endmodule
