//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_queue;

    parameter WIDTH = 8;
    parameter DEPTH = 8;
    parameter ADDR_WIDTH = 3;

    reg clk, reset, enqueue, dequeue;
    reg [WIDTH-1:0] data_in;
    wire [WIDTH-1:0] data_out;
    wire full, empty;

    // Instantiate the queue
    queue #(WIDTH, DEPTH, ADDR_WIDTH) dut (
        .clk(clk),
        .reset(reset),
        .enqueue(enqueue),
        .dequeue(dequeue),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        enqueue = 0;
        dequeue = 0;
        data_in = 0;

        #10 reset = 0;

        // ENQUEUE 3 values
        #10 enqueue = 1; data_in = 8'd10;
        #10 data_in = 8'd20;
        #10 data_in = 8'd30;
        #10 enqueue = 0;

        // DEQUEUE 2 values
        #10 dequeue = 1;
        #10;
        #10 dequeue = 0;

        // ENQUEUE more
        #10 enqueue = 1; data_in = 8'd40;
        #10 data_in = 8'd50;
        #10 enqueue = 0;

        // DEQUEUE all
        #10 dequeue = 1;
        #50 dequeue = 0;

        #20 $finish;
    end

    initial begin
        $monitor("T=%0t | ENQ=%b DEQ=%b IN=%d OUT=%d FULL=%b EMPTY=%b", 
                  $time, enqueue, dequeue, data_in, data_out, full, empty);
    end

endmodule
