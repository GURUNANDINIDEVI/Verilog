//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_siso_shift_register;
reg clk;
reg rst;
reg serial_in;
wire serial_out;

// Instantiate DUT
siso_shift_register u1(.clk(clk),.rst(rst),.serial_in(serial_in),.serial_out(serial_out));

// Clock generation: 10ns period
always #5 clk = ~clk;

initial begin
    $dumpfile("siso_shift_register.vcd");
    $dumpvars(0, tb_siso_shift_register);

    // Initialize
    clk = 0; rst = 1; serial_in = 0;

    // Reset
    #10 rst = 0;

    // Send serial bits: 1 0 1 1
    #10 serial_in = 1;
    #10 serial_in = 0;
    #10 serial_in = 1;
    #10 serial_in = 1;

    // Continue for extra clock cycles to observe output
    #40;

    $finish;
end

endmodule
