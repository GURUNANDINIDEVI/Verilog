//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_johnson_counter;

reg clk;
reg rst;
wire [3:0] out;

// Instantiate DUT
johnson_counter u1(.clk(clk),.rst(rst),.out(out));

// Clock generation (10ns period)
always #5 clk = ~clk;

initial begin
    $dumpfile("johnson_counter.vcd");
    $dumpvars(0, tb_johnson_counter);

    // Initialization
    clk = 0; rst = 1;

    // Apply reset
    #10 rst = 0;

    // Let the counter run through 10 states
    #100 $finish;
end

endmodule
