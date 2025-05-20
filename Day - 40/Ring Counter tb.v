//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_ring_counter;
reg clk;
reg rst;
wire [3:0] out;

ring_counter u1(.clk(clk),.rst(rst),.out(out));

// Clock generation (10ns period)
always #5 clk = ~clk;

initial begin
    $dumpfile("ring_counter.vcd");
    $dumpvars(0, tb_ring_counter);

    // Initialization
    clk = 0; rst = 1;

    // Apply reset
    #10 rst = 0;

    // Let it run for 8 cycles
    #80 $finish;
end

endmodule
