//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module lfsr_4bit (
    input clk,
    input rst,
    output reg [3:0] lfsr_out
);

wire feedback;

assign feedback = lfsr_out[3] ^ lfsr_out[2]; // taps at bit 4 and 3

always @(posedge clk or posedge rst) begin
    if (rst)
        lfsr_out <= 4'b0001; // non-zero seed
    else
        lfsr_out <= {lfsr_out[2:0], feedback}; // shift left, insert feedback
end

endmodule
