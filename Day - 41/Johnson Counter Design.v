// T.Guru Nandini Devi
// nandinidevitekumudi@gmail.com
module johnson_counter (
    input clk,
    input rst,
    output reg [3:0] out
);

always @(posedge clk or posedge rst) begin
    if (rst)
        out <= 4'b0000;
    else
        out <= {~out[3], out[3:1]};  // Shift right with inverted MSB fed back
end

endmodule
