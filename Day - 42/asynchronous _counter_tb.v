//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_async_counter;

reg clk;
reg rst;
wire [3:0] q;

async_counter u1(.clk(clk),.rst(rst),.q(q));

// Generate 10ns clock
always #5 clk = ~clk;

initial begin
    $dumpfile("async_counter.vcd");
    $dumpvars(0, tb_async_counter);

  $monitor("Time = %0t | clk = %b | rst = %b | q = %b", $time, clk, rst, q);

    clk = 0; rst = 1;

    #10 rst = 0;

    // Run the counter for a while
    #200;

    $finish;
end

endmodule
