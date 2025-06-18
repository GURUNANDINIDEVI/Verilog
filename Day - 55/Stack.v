//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module stack #(
    parameter WIDTH = 8,
    parameter DEPTH = 8,
    parameter ADDR_WIDTH = 3  // log2(DEPTH) = 3 for DEPTH = 8
)(
    input clk,
    input reset,
    input push,
    input pop,
    input [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out,
    output reg full,
    output reg empty
);

    reg [WIDTH-1:0] mem [0:DEPTH-1];
    reg [ADDR_WIDTH:0] sp;  // Stack pointer

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            sp <= 0;
            full <= 0;
            empty <= 1;
            data_out <= 0;
        end
        else begin
            // PUSH
            if (push && !full) begin
                mem[sp] <= data_in;
                sp <= sp + 1;
            end

            // POP
            if (pop && !empty) begin
                sp <= sp - 1;
                data_out <= mem[sp - 1];
            end

            // Flags
            full <= (sp == DEPTH);
            empty <= (sp == 0);
        end
    end

endmodule
