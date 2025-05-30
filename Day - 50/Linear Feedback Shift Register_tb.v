//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_lfsr_4bit;

reg clk, rst;
wire [3:0] lfsr_out;

lfsr_4bit u1 (.clk(clk), .rst(rst), .lfsr_out(lfsr_out));

// Clock generation
always #5 clk = ~clk;

initial begin
    $dumpfile("lfsr.vcd");
    $dumpvars(0, tb_lfsr_4bit);
    $monitor("Time = %0t | LFSR = %b", $time, lfsr_out);

    clk = 0; rst = 1;
    #10 rst = 0;

    #160 $finish;
end

endmodule
