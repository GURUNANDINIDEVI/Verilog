//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_async_fifo;

    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4;

    reg wr_clk = 0, rd_clk = 0;
    reg wr_rst = 1, rd_rst = 1;
    reg wr_en = 0, rd_en = 0;
    reg [DATA_WIDTH-1:0] wr_data = 0;
    wire [DATA_WIDTH-1:0] rd_data;
    wire fifo_full, fifo_empty;

    // Clock generation
    always #5  wr_clk = ~wr_clk; // 100 MHz
    always #7  rd_clk = ~rd_clk; // ~71 MHz (async)

    // Instantiate the async FIFO
    async_fifo #(DATA_WIDTH, ADDR_WIDTH) dut (
        .wr_clk(wr_clk),
        .wr_rst(wr_rst),
        .wr_en(wr_en),
        .wr_data(wr_data),
        .fifo_full(fifo_full),

        .rd_clk(rd_clk),
        .rd_rst(rd_rst),
        .rd_en(rd_en),
        .rd_data(rd_data),
        .fifo_empty(fifo_empty)
    );

    initial begin
        // Reset
        #10 wr_rst = 0;
        #15 rd_rst = 0;

        // Write 10 bytes
        repeat(10) begin
            @(posedge wr_clk);
            wr_en = 1;
            wr_data = wr_data + 1;
        end
        wr_en = 0;

        // Wait then read 10 bytes
        #50;
        repeat(10) begin
            @(posedge rd_clk);
            rd_en = 1;
        end
        rd_en = 0;

        #50 $finish;
    end

    initial begin
        $display("Time\tWr_En\tWr_Data\tRd_En\tRd_Data\tFull\tEmpty");
        forever @(posedge wr_clk or posedge rd_clk) begin
            $strobe("%0t\t%b\t%h\t%b\t%h\t%b\t%b",
                    $time, wr_en, wr_data, rd_en, rd_data, fifo_full, fifo_empty);
        end
    end

endmodule
