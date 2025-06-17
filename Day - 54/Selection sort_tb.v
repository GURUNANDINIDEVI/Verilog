//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_selection_sort;

    parameter N = 5;
    parameter WIDTH = 8;

    reg [WIDTH-1:0] in_array [0:N-1];
    wire [WIDTH-1:0] out_array [0:N-1];
    integer i;

    // Instantiating the selection_sort
    selection_sort #(N, WIDTH) dut (.in_array(in_array),.out_array(out_array));

    initial begin
        // Initializing array with arbitrary values
        in_array[0] = 8'd30;
        in_array[1] = 8'd10;
        in_array[2] = 8'd50;
        in_array[3] = 8'd20;
        in_array[4] = 8'd40;

        #5;

        $display("Original array:");
        for (i = 0; i < N; i = i + 1) begin
            $display("%d : %d", i, in_array[i]);
        end

        $display("\nSelection Sorted array:");
        for (i = 0; i < N; i = i + 1) begin
            $display("%d : %d", i, out_array[i]);
        end

        $finish;
    end

endmodule
