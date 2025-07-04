//T.Guru Nandini devi
//nandinidevitekumudi@gmail.com
module dma_controller #(
    parameter ADDR_WIDTH = 4,
    parameter DATA_WIDTH = 8
)(
    input clk,
    input reset,
    input start,
    input [ADDR_WIDTH-1:0] size,

    output reg [ADDR_WIDTH-1:0] addr,
    output reg rd_en,
    output reg wr_en,
    output reg done
);

    reg [ADDR_WIDTH-1:0] count;
    reg [1:0] state;

    localparam IDLE  = 2'b00,
               READ  = 2'b01,
               WRITE = 2'b10,
               DONE  = 2'b11;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            addr <= 0;
            count <= 0;
            rd_en <= 0;
            wr_en <= 0;
            done <= 0;
        end else begin
            case (state)
                IDLE: begin
                    done <= 0;
                    if (start) begin
                        state <= READ;
                        addr <= 0;
                        count <= 0;
                    end
                end

                READ: begin
                    rd_en <= 1;
                    wr_en <= 0;
                    state <= WRITE;
                end

                WRITE: begin
                    rd_en <= 0;
                    wr_en <= 1;
                    if (count == size - 1) begin
                        state <= DONE;
                    end else begin
                        count <= count + 1;
                        addr <= addr + 1;
                        state <= READ;
                    end
                end

                DONE: begin
                    wr_en <= 0;
                    rd_en <= 0;
                    done <= 1;
                    state <= IDLE;  // auto-restart option
                end
            endcase
        end
    end

endmodule
