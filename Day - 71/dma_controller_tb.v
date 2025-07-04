//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_dma_controller;

    reg clk, reset, start;
    reg [3:0] size;
    wire [3:0] addr;
    wire rd_en, wr_en, done;

    // Instantiate the DMA controller
    dma_controller dut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .size(size),
        .addr(addr),
        .rd_en(rd_en),
        .wr_en(wr_en),
        .done(done)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; start = 0; size = 4;
        #10 reset = 0;
        #10 start = 1;
        #10 start = 0;

        // Observe transfer process
        #100 $finish;
    end

    initial begin
        $display("Time\tAddr\tRD_EN\tWR_EN\tDONE");
        $monitor("%0t\t%0d\t%b\t%b\t%b", $time, addr, rd_en, wr_en, done);
    end

endmodule
