//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module fifo_sync #(
    parameter DATA_WIDTH = 8,
    parameter DEPTH = 8
)(
    input clk,
    input reset,
    input wr_en,
    input rd_en,
    input [DATA_WIDTH-1:0] data_in,

    output reg [DATA_WIDTH-1:0] data_out,
    output reg full,
    output reg empty
);

    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];
    reg [$clog2(DEPTH):0] wr_ptr, rd_ptr;
    reg [$clog2(DEPTH+1):0] fifo_count;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
            fifo_count <= 0;
            full <= 0;
            empty <= 1;
        end else begin
            // Write Operation
            if (wr_en && !full) begin
                mem[wr_ptr] <= data_in;
                wr_ptr <= wr_ptr + 1;
                fifo_count <= fifo_count + 1;
            end

            // Read Operation
            if (rd_en && !empty) begin
                data_out <= mem[rd_ptr];
                rd_ptr <= rd_ptr + 1;
                fifo_count <= fifo_count - 1;
            end

            // Status Flags
            full <= (fifo_count == DEPTH);
            empty <= (fifo_count == 0);
        end
    end

endmodule
