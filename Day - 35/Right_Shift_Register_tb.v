//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_shift_register_right;
reg clk;
reg rst;
reg load;
reg shift;
reg [3:0] data_in;
wire [3:0] data_out;

// Instantiate the design under test (DUT)
shift_register_right u1(.clk(clk),.rst(rst),.load(load),.shift(shift),.data_in(data_in),.data_out(data_out));

// Clock: 10ns period
always #5 clk = ~clk;

initial begin
    // Dump file for waveform
    $dumpfile("shift_register_right.vcd");
    $dumpvars(0, tb_shift_register_right);

    // Initialize
    clk = 0; rst = 1; load = 0; shift = 0; data_in = 4'b0000;

    // Reset pulse
    #10 rst = 0;

    // Load input data
    #10 data_in = 4'b1011; load = 1;
    #10 load = 0;

    // Shift right 4 times
    #10 shift = 1;
    #40 shift = 0;

    #10 $finish;
end

endmodule
