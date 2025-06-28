//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module serial_to_parallel #(
    parameter WIDTH = 8  // Number of bits to collect
)(
    input clk,
    input reset,
    input serial_in,
    input enable,               // Load enable signal
    output reg [WIDTH-1:0] parallel_out,
    output reg done            // High when WIDTH bits are loaded
);

    reg [$clog2(WIDTH):0] count;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;
            parallel_out <= 0;
            done <= 0;
        end else if (enable) begin
            parallel_out <= {parallel_out[WIDTH-2:0], serial_in}; // shift left
            count <= count + 1;
            if (count == WIDTH - 1)
                done <= 1;
            else
                done <= 0;
        end
    end

endmodule
