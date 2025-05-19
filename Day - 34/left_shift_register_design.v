//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module left_shift_register (
    input clk,
    input rst,
    input SI,           // Serial Input (bit to shift in)
    output reg [3:0] Q  // 4-bit shift register output
);

always @(posedge clk or posedge rst) begin
    if (rst)
        Q <= 4'b0000;
    else
        Q <= {Q[2:0], SI};  // Left shift and insert SI at LSB
end

endmodule
