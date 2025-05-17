//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_piso_shift_register;
reg clk;
reg rst;
reg load;
reg [3:0] parallel_in;
wire serial_out;

// Instantiate the DUT
piso_shift_register u1(.clk(clk),.rst(rst),.load(load),.parallel_in(parallel_in),.serial_out(serial_out));

// Clock: 10ns period
always #5 clk = ~clk;

initial begin
    $dumpfile("piso_shift_register.vcd");
    $dumpvars(0, tb_piso_shift_register);

    // Initialize
    clk = 0; rst = 1; load = 0; parallel_in = 4'b0000;

    // Apply reset
    #10 rst = 0;

    // Load data: 1011
    #10 parallel_in = 4'b1011; load = 1;
    #10 load = 0;

    // Begin shifting (4 cycles)
    #40;

    #10 $finish;
end

endmodule
