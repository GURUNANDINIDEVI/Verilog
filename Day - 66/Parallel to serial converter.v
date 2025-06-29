//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module parallel_to_serial #(
    parameter WIDTH = 8
)(
    input clk,
    input reset,
    input load,                     // Load parallel data
    input enable,                   // Enable serial shifting
    input [WIDTH-1:0] parallel_in,  // Input parallel data
    output reg serial_out,          // Output 1-bit at a time
    output reg done                 // High when all bits are transmitted
);

    reg [WIDTH-1:0] shift_reg;
    reg [$clog2(WIDTH):0] count;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= 0;
            count <= 0;
            serial_out <= 0;
            done <= 0;
        end
        else if (load) begin
            shift_reg <= parallel_in;
            count <= 0;
            done <= 0;
        end
        else if (enable && !done) begin
            serial_out <= shift_reg[WIDTH-1];
            shift_reg <= shift_reg << 1;
            count <= count + 1;
            if (count == WIDTH - 1)
                done <= 1;
        end
    end

endmodule
