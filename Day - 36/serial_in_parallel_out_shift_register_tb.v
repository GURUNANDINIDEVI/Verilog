//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_sipo_shift_register;
reg clk;
reg rst;
reg serial_in;
wire [3:0] parallel_out;

// Instantiate the SIPO shift register
sipo_shift_register u1(.clk(clk),.rst(rst),.serial_in(serial_in),.parallel_out(parallel_out));

// Clock generation: 10ns period
always #5 clk = ~clk;

initial begin
    // VCD dump for waveform
    $dumpfile("sipo_shift_register.vcd");
    $dumpvars(0, tb_sipo_shift_register);

    // Initialize
    clk = 0; rst = 1; serial_in = 0;

    // Reset
    #10 rst = 0;

    // Shift in bits: 1 0 1 1 (MSB first)
    #10 serial_in = 1;
    #10 serial_in = 0;
    #10 serial_in = 1;
    #10 serial_in = 1;

    #20 $finish;
end

endmodule
