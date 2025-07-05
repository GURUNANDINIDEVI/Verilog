//T.Guru Nandini Devi
//nandinideviyekumudi@gmail.com
`timescale 1ns/1ps

module tb_fifo_sync;

    parameter DATA_WIDTH = 8;
    parameter DEPTH = 8;

    reg clk, reset;
    reg wr_en, rd_en;
    reg [DATA_WIDTH-1:0] data_in;
    wire [DATA_WIDTH-1:0] data_out;
    wire full, empty;

    // Instantiate FIFO
    fifo_sync #(DATA_WIDTH, DEPTH) dut (
        .clk(clk),
        .reset(reset),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1;
        wr_en = 0; rd_en = 0;
        data_in = 0;

        #10 reset = 0;

        // Write data into FIFO
        repeat(5) begin
            @(posedge clk);
            wr_en = 1;
            data_in = data_in + 1;
        end
        @(posedge clk);
        wr_en = 0;

        // Read data from FIFO
        repeat(5) begin
            @(posedge clk);
            rd_en = 1;
        end
        @(posedge clk);
        rd_en = 0;

        #20 $finish;
    end

    initial begin
        $display("Time\tWrite\tData In\tRead\tData Out\tFull\tEmpty");
        $monitor("%0t\t%b\t%h\t%b\t%h\t\t%b\t%b", $time, wr_en, data_in, rd_en, data_out, full, empty);
    end

endmodule
