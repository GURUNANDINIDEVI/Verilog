//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module simple_rom (
    input [1:0] addr,
    output reg [7:0] dout
);

always @(*) begin
    case (addr)
        2'b00: dout = 8'hAA;
        2'b01: dout = 8'hBB;
        2'b10: dout = 8'hCC;
        2'b11: dout = 8'hDD;
        default: dout = 8'h00;
    endcase
end

endmodule
