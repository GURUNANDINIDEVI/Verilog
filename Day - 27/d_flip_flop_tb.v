//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_d_flip_flop;
    reg clk, rst, d;
    wire q;
    // Instantiate the flip-flop
    d_flip_flop uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );
    // Clock generation: 10ns period
    always #5 clk = ~clk;

    // Waveform generation
    initial begin
        $dumpfile("d_flip_flop.vcd");
        $dumpvars(0, tb_d_flip_flop);
    end

    // Stimulus
    initial begin
        $display("Time\tclk\trst\td\tq");
        $monitor("%0dns\t%b\t%b\t%b\t%b", $time, clk, rst, d, q);

        // Initialize
        clk = 0; rst = 1; d = 0;
        #10;

        // Deassert reset, start applying inputs
        rst = 0; d = 1; #10;
        d = 0; #10;
        d = 1; #10;

        // Trigger reset again
        rst = 1; #10;
        rst = 0; d = 0; #10;
        d = 1; #10;

        $finish;
    end

endmodule
