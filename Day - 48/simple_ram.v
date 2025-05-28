//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module simple_ram (
    input clk,
    input we,                  // write enable
    input [1:0] addr,          // 2-bit address (4 locations)
    input [7:0] din,           // 8-bit input data
    output reg [7:0] dout      // 8-bit output data
);

reg [7:0] mem [0:3];  // 4x8 RAM

always @(posedge clk) begin
    if (we)
        mem[addr] <= din;      // Write
    else
        dout <= mem[addr];     // Read
end

endmodule
