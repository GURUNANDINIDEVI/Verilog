//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_seq_detector;
reg clk, rst, din;
wire dout;
// Instantiate the DUT
seq_detector u1(.clk(clk),.rst(rst),.din(din),.dout(dout));

// Clock generation (10ns period)
always #5 clk = ~clk;

initial begin
    $dumpfile("seq_detector.vcd");
    $dumpvars(0, tb_seq_detector);
    $monitor("Time = %0t | din = %b | dout = %b", $time, din, dout);

    // Initialize
    clk = 0; rst = 1; din = 0;

    // Deassert reset
    #10 rst = 0;

    // Apply input sequence: 1 0 1 1 (should detect here)
    din = 1; #10;
    din = 0; #10;
    din = 1; #10;
    din = 1; #10; // Output should go high here

    // Apply overlapping sequence: 0 1 1
    din = 1; #10;
    din = 0; #10;
    din = 1; #10;
    din = 1; #10; // Output should go high again

    #20 $finish;
end

endmodule
