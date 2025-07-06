//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module async_fifo #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4  // FIFO depth = 2^ADDR_WIDTH
)(
    input wr_clk,
    input wr_rst,
    input wr_en,
    input [DATA_WIDTH-1:0] wr_data,
    output reg fifo_full,

    input rd_clk,
    input rd_rst,
    input rd_en,
    output reg [DATA_WIDTH-1:0] rd_data,
    output reg fifo_empty
);

    // Memory
    reg [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];

    // Pointers
    reg [ADDR_WIDTH:0] wr_ptr_bin, rd_ptr_bin;
    reg [ADDR_WIDTH:0] wr_ptr_gray, rd_ptr_gray;

    // Synchronized pointers
    reg [ADDR_WIDTH:0] rd_ptr_gray_sync1, rd_ptr_gray_sync2;
    reg [ADDR_WIDTH:0] wr_ptr_gray_sync1, wr_ptr_gray_sync2;

    // ---------- Write Side ----------
    always @(posedge wr_clk or posedge wr_rst) begin
        if (wr_rst) begin
            wr_ptr_bin  <= 0;
            wr_ptr_gray <= 0;
        end else if (wr_en && !fifo_full) begin
            mem[wr_ptr_bin[ADDR_WIDTH-1:0]] <= wr_data;
            wr_ptr_bin  <= wr_ptr_bin + 1;
            wr_ptr_gray <= (wr_ptr_bin + 1) ^ ((wr_ptr_bin + 1) >> 1); // Binary to Gray
        end
    end

    // ---------- Read Side ----------
    always @(posedge rd_clk or posedge rd_rst) begin
        if (rd_rst) begin
            rd_ptr_bin  <= 0;
            rd_ptr_gray <= 0;
            rd_data     <= 0;
        end else if (rd_en && !fifo_empty) begin
            rd_data     <= mem[rd_ptr_bin[ADDR_WIDTH-1:0]];
            rd_ptr_bin  <= rd_ptr_bin + 1;
            rd_ptr_gray <= (rd_ptr_bin + 1) ^ ((rd_ptr_bin + 1) >> 1);
        end
    end

    // ---------- Pointer Synchronization ----------
    // Sync read pointer into write clock domain
    always @(posedge wr_clk or posedge wr_rst) begin
        if (wr_rst) begin
            rd_ptr_gray_sync1 <= 0;
            rd_ptr_gray_sync2 <= 0;
        end else begin
            rd_ptr_gray_sync1 <= rd_ptr_gray;
            rd_ptr_gray_sync2 <= rd_ptr_gray_sync1;
        end
    end

    // Sync write pointer into read clock domain
    always @(posedge rd_clk or posedge rd_rst) begin
        if (rd_rst) begin
            wr_ptr_gray_sync1 <= 0;
            wr_ptr_gray_sync2 <= 0;
        end else begin
            wr_ptr_gray_sync1 <= wr_ptr_gray;
            wr_ptr_gray_sync2 <= wr_ptr_gray_sync1;
        end
    end

    // ---------- Full/Empty Detection ----------
    wire [ADDR_WIDTH:0] wr_ptr_bin_next = (wr_ptr_bin + 1);
    wire [ADDR_WIDTH:0] rd_ptr_bin_next = (rd_ptr_bin + 1);

    always @(*) begin
        fifo_full  = (wr_ptr_gray == {~rd_ptr_gray_sync2[ADDR_WIDTH:ADDR_WIDTH-1], rd_ptr_gray_sync2[ADDR_WIDTH-2:0]});
        fifo_empty = (rd_ptr_gray == wr_ptr_gray_sync2);
    end

endmodule
