//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_parallel_to_serial;

    parameter WIDTH = 8;

    reg clk, reset, load, enable;
    reg [WIDTH-1:0] parallel_in;
    wire serial_out;
    wire done;

    // Instantiate the converter
    parallel_to_serial #(WIDTH) dut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .enable(enable),
        .parallel_in(parallel_in),
        .serial_out(serial_out),
        .done(done)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        load = 0;
        enable = 0;
        parallel_in = 8'b10110110;

        #10 reset = 0;
        #10 load = 1;
        #10 load = 0;
        enable = 1;

        #100;  // Enough time to shift all bits

        enable = 0;
        $finish;
    end

    initial begin
        $display("Time\tSerial_Out\tDone");
        $monitor("%t\t%b\t\t%b", $time, serial_out, done);
    end

endmodule
