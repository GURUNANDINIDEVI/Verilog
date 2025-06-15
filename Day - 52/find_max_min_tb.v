//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_find_max_min;

    parameter N = 5;
    parameter WIDTH = 8;

    reg [WIDTH-1:0] in_array [0:N-1];
    wire [WIDTH-1:0] max_val;
    wire [WIDTH-1:0] min_val;

    integer i;

    // Instantiating the max and min finder
    find_max_min #(N, WIDTH) dut (
        .in_array(in_array),
        .max_val(max_val),
        .min_val(min_val)
    );

    initial begin
        // Initializing array
        in_array[0] = 8'd10;
        in_array[1] = 8'd20;
        in_array[2] = 8'd5;
        in_array[3] = 8'd30;
        in_array[4] = 8'd15;

        #5;

        $display("Array elements:");
        for (i = 0; i < N; i = i + 1) begin
            $display("%d : %d", i, in_array[i]);
        end

        $display("\nMaximum = %d", max_val);
        $display("Minimum = %d", min_val);

        $finish;
    end

endmodule
