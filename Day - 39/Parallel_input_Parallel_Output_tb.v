//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_pipo_shift_register;
reg clk;
reg rst;
reg load;
reg [3:0] parallel_in;
wire [3:0] parallel_out;

// Instantiate DUT
pipo_shift_register u1(.clk(clk),.rst(rst),.load(load),.parallel_in(parallel_in),.parallel_out(parallel_out));

// Generate clock: 10ns period
always #5 clk = ~clk;

initial begin
    $dumpfile("pipo_shift_register.vcd");
    $dumpvars(0, tb_pipo_shift_register);

    // Initialize
    clk = 0; rst = 1; load = 0; parallel_in = 4'b0000;

    // Reset the register
    #10 rst = 0;

    // Load 1011
    #10 parallel_in = 4'b1011; load = 1;
    #10 load = 0;

    // Change input (should not affect output without load)
    #10 parallel_in = 4'b1100;

    #20 $finish;
end

endmodule
