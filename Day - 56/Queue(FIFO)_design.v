//T.Guru Nandini devi
//nandinidevitekumudi@gmail.com
module queue #(
    parameter WIDTH = 8,
    parameter DEPTH = 8,
    parameter ADDR_WIDTH = 3  // log2(DEPTH)
)(
    input clk,
    input reset,
    input enqueue,
    input dequeue,
    input [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out,
    output reg full,
    output reg empty
);

    reg [WIDTH-1:0] mem [0:DEPTH-1];
    reg [ADDR_WIDTH-1:0] head, tail;
    reg [ADDR_WIDTH:0] count;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            head <= 0;
            tail <= 0;
            count <= 0;
            full <= 0;
            empty <= 1;
            data_out <= 0;
        end else begin
            // ENQUEUE operation
            if (enqueue && !full) begin
                mem[tail] <= data_in;
                tail <= (tail + 1) % DEPTH;
                count <= count + 1;
            end

            // DEQUEUE operation
            if (dequeue && !empty) begin
                data_out <= mem[head];
                head <= (head + 1) % DEPTH;
                count <= count - 1;
            end

            // Update full and empty flags
            full <= (count == DEPTH);
            empty <= (count == 0);
        end
    end

endmodule
