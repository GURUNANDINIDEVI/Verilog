//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_mealy_seq_detector;
reg clk, rst, din;
wire dout;

mealy_seq_detector u1(.clk(clk),.rst(rst),.din(din),.dout(dout));

// Clock generation
always #5 clk = ~clk;

initial begin
    $dumpfile("mealy_seq.vcd");
    $dumpvars(0, tb_mealy_seq_detector);
    $monitor("Time=%0t | din=%b | dout=%b", $time, din, dout);

    clk = 0;
    rst = 1;
    din = 0;

    #10 rst = 0;

    // Input sequence: 1 0 1 1
    din = 1; #10;
    din = 0; #10;
    din = 1; #10;
    din = 1; #10; // dout = 1 here

    // Overlap support: 0 1 1
    din = 0; #10;
    din = 1; #10;
    din = 1; #10; // dout = 1 again

    #20 $finish;
end

endmodule
