//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_serial_to_parallel;

    parameter WIDTH = 8;

    reg clk, reset, serial_in, enable;
    wire [WIDTH-1:0] parallel_out;
    wire done;

    // Instantiate the converter
    serial_to_parallel #(WIDTH) dut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .enable(enable),
        .parallel_out(parallel_out),
        .done(done)
    );

    // Clock generation
    always #5 clk = ~clk;

    reg [WIDTH-1:0] serial_data;
    integer i;

    initial begin
        clk = 0;
        reset = 1;
        enable = 0;
        serial_in = 0;
        serial_data = 8'b11010101;  // Example serial data (MSB first)

        #10 reset = 0;

        enable = 1;
        for (i = WIDTH-1; i >= 0; i = i - 1) begin
            serial_in = serial_data[i];
            #10;
        end

        enable = 0;
        $display("Final Parallel Output: %b", parallel_out);
        $display("Done Signal: %b", done);

        #10 $finish;
    end

endmodule
