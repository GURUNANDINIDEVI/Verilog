// T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module ring_counter (
    input clk,
    input rst,
    output reg [3:0] out
);

always @(posedge clk or posedge rst) begin
    if (rst)
        out <= 4'b1000; // Initial one-hot state
    else
        out <= {out[0], out[3:1]}; // Right rotate
end

endmodule
