//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_t_latch;
reg T;
reg clk;
wire Q;
// Instantiate the T Latch
t_latch u1(.T(T),.clk(clk),.Q(Q));
// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // Clock with 10ns period
end
// Stimulus
initial begin
    $dumpfile("t_latch_waveform.vcd");
    $dumpvars(0, tb_t_latch);
    // Initial values
    T = 0;
    #10;
    T = 1; #10;
    T = 1; #10;
    T = 0; #10;
    T = 1; #10;
    T = 0; #10;
    T = 1; #10;
    T = 1; #10;
    T = 0; #10;
    $finish;
end
endmodule
