//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_t_flip_flop;
    reg clk, rst, t;
    wire q;
    // Instantiate T flip-flop
    t_flip_flop u1(.clk(clk),.rst(rst),.t(t),.q(q));
    // Clock generation: 10ns period
    always #5 clk = ~clk;
    // VCD file for GTKWave
    initial begin
        $dumpfile("t_flip_flop.vcd");
        $dumpvars(0, tb_t_flip_flop);
    end
    // Stimulus
    initial begin
        $display("Time\tclk\trst\tt\tq");
        $monitor("%0dns\t%b\t%b\t%b\t%b", $time, clk, rst, t, q);

        clk = 0; rst = 1; t = 0; #10;  // Apply reset
        rst = 0;
        t = 1; #20;   // Toggle on every clk edge
        t = 0; #20;   // Hold value
        t = 1; #40;   // Toggle again
        rst = 1; #10; // Reset
        rst = 0; t = 1; #20;
        $finish;
    end
endmodule
