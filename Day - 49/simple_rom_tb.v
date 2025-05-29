//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_simple_rom;

reg [1:0] addr;
wire [7:0] dout;

simple_rom u1 (.addr(addr), .dout(dout));

initial begin
    $dumpfile("rom.vcd");
    $dumpvars(0, tb_simple_rom);
    $monitor("Time=%0t | Addr=%b | DOUT=%h", $time, addr, dout);

    addr = 2'b00; #10;
    addr = 2'b01; #10;
    addr = 2'b10; #10;
    addr = 2'b11; #10;

    #20 $finish;
end

endmodule
