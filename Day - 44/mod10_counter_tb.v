//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_mod10_counter;
reg clk;
reg rst;
wire [3:0] q;

mod10_counter u1(.clk(clk),.rst(rst),.q(q));

// Generate clock with 10ns period
always #5 clk = ~clk;

initial begin
    $dumpfile("mod10_counter.vcd");
    $dumpvars(0, tb_mod10_counter);

    // Monitor changes
    $monitor("Time = %0t | clk = %b | rst = %b | q = %b (%0d)", $time, clk, rst, q, q);

    clk = 0; rst = 1;

    #10 rst = 0;

    // Run for 150ns
    #150;

    $finish;
end

endmodule
