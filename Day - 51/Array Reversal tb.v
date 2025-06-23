//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps
module tb_reverse_array;

    parameter N = 5;
    parameter WIDTH = 8;

    reg  [WIDTH-1:0] in_array     [0:N-1];
    wire [WIDTH-1:0] out_array    [0:N-1];
    reg  [N*WIDTH-1:0] in_array_flat;
    wire [N*WIDTH-1:0] out_array_flat;

    integer i;

    // Flattening input array
    always @(*) begin
        for (i = 0; i < N; i = i + 1)
            in_array_flat[i*WIDTH +: WIDTH] = in_array[i];
    end

    // Unflattening output array
    genvar j;
    generate
        for (j = 0; j < N; j = j + 1)
            assign out_array[j] = out_array_flat[j*WIDTH +: WIDTH];
    endgenerate

    // Instantiating the reverse_array module
    reverse_array #(N, WIDTH) u1 (
        .in_array_flat(in_array_flat),
        .out_array_flat(out_array_flat)
    );

    initial begin
        // Initializing the input array
        in_array[0] = 8'd1;
        in_array[1] = 8'd2;
        in_array[2] = 8'd3;
        in_array[3] = 8'd4;
        in_array[4] = 8'd5;

        #5;

        $display("Original array:");
        for (i = 0; i < N; i = i + 1)
            $display("Index %0d : %0d", i, in_array[i]);

        $display("\nReversed array:");
        for (i = 0; i < N; i = i + 1)
            $display("Index %0d : %0d", i, out_array[i]);

        $finish;
    end

endmodule
