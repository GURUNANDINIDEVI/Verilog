// T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module piso_shift_register (
    input clk,
    input rst,
    input load,
    input [3:0] parallel_in,
    output reg serial_out
);

reg [3:0] shift_reg;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        shift_reg <= 4'b0000;
        serial_out <= 1'b0;
    end
  else if (load) begin
        shift_reg <= parallel_in;        // Load data
    end 
  else begin
        serial_out <= shift_reg[0];      // Output LSB
        shift_reg <= {1'b0, shift_reg[3:1]}; // Right shift
    end
end

endmodule
