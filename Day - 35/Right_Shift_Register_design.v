//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module shift_register_right (
    input clk,
    input rst,
    input load,
    input shift,
    input [3:0] data_in,
    output reg [3:0] data_out
);

always @(posedge clk or posedge rst) begin
    if (rst)
        data_out <= 4'b0000;
    else if (load)
        data_out <= data_in;              // Load parallel data
    else if (shift)
        data_out <= {1'b0, data_out[3:1]}; // Right shift
end

endmodule
