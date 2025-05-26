//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_moore_seq_detector;

reg clk, rst, din;
wire dout;

moore_seq_detector u1(.clk(clk),.rst(rst),.din(din),.dout(dout));

// Clock generator
always #5 clk = ~clk;

initial begin
    $dumpfile("moore_seq.vcd");
    $dumpvars(0, tb_moore_seq_detector);
    $monitor("Time=%0t | din=%b | dout=%b", $time, din, dout);

    clk = 0;
    rst = 1;
    din = 0;

    #10 rst = 0;

    // Send input pattern: 1 0 1 1 (should detect here)
    din = 1; #10;
    din = 0; #10;
    din = 1; #10;
    din = 1; #10;

    // Overlapping detection: 0 1 1
    din = 0; #10;
    din = 1; #10;
    din = 1; #10;

    #20 $finish;
end

endmodule
