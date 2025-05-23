//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_sync_counter;

reg clk;
reg rst;
wire [3:0] q;

// Instantiate DUT
sync_counter u1(.clk(clk),.rst(rst),.q(q));

// Clock generation (10ns period)
always #5 clk = ~clk;

initial begin
    $dumpfile("sync_counter.vcd");
    $dumpvars(0, tb_sync_counter);

    // Monitor changes
    $monitor("Time = %0t | clk = %b | rst = %b | q = %b", $time, clk, rst, q);

    // Initialization
    clk = 0; rst = 1;

    #10 rst = 0; // Deassert reset

    // Let it run for several cycles
    #200;

    $finish;
end

endmodule
