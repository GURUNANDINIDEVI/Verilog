//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module right_shift_register (
    input clk,
    input rst,
    input SI,           // Serial Input (bit to shift in from MSB side)
    output reg [3:0] Q  // 4-bit register
);

always @(posedge clk or posedge rst) begin
    if (rst)
        Q <= 4'b0000;
    else
        Q <= {SI, Q[3:1]};  // Right shift and insert SI at MSB
end

endmodule
