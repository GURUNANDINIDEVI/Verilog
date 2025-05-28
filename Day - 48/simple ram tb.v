//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_simple_ram;

reg clk, we;
reg [1:0] addr;
reg [7:0] din;
wire [7:0] dout;

simple_ram u1 (.clk(clk), .we(we), .addr(addr), .din(din), .dout(dout));

// Clock generator
always #5 clk = ~clk;

initial begin
    $dumpfile("ram.vcd");
    $dumpvars(0, tb_simple_ram);
    $monitor("Time=%0t | WE=%b | Addr=%b | DIN=%h | DOUT=%h", $time, we, addr, din, dout);

    clk = 0; we = 0; addr = 0; din = 0;

    // Write values
    #10 we = 1; addr = 2'b00; din = 8'hA5;
    #10 addr = 2'b01; din = 8'h3C;
    #10 addr = 2'b10; din = 8'h7E;
    #10 we = 0;

    // Read values
    #10 addr = 2'b00;
    #10 addr = 2'b01;
    #10 addr = 2'b10;

    #20 $finish;
end

endmodule
