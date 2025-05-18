//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module siso_shift_register (
    input clk,
    input rst,
    input serial_in,
    output reg serial_out
);

reg [3:0] shift_reg;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        shift_reg <= 4'b0000;
        serial_out <= 1'b0;
    end else begin
        shift_reg <= {serial_in, shift_reg[3:1]}; // Right shift
        serial_out <= shift_reg[0];              // Output LSB
    end
end

endmodule
