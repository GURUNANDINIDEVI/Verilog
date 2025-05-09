//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_sr_flip_flop;
    reg clk, rst, s, r;
    wire q;
    // Instantiate the module
    sr_flip_flop u1(.clk(clk),.rst(rst),.s(s),.r(r),.q(q));

    // Clock generation
    always #5 clk = ~clk;  // 10ns period
    initial begin
        $dumpfile("sr_flip_flop.vcd");
        $dumpvars(0, tb_sr_flip_flop);
    end
    // Stimulus
    initial begin
        $display("Time\tclk\trst\ts\tr\tq");
        $monitor("%0dns\t%b\t%b\t%b\t%b\t%b", $time, clk, rst, s, r, q);
        clk = 0; rst = 1; s = 0; r = 0; #10;
        rst = 0;
        // Set operation
        s = 1; r = 0; #10;
        // Reset operation
        s = 0; r = 1; #10;
        // Hold
        s = 0; r = 0; #10;
        // Invalid condition
        s = 1; r = 1; #10;
        // Reset
        rst = 1; #10;
        $finish;
    end
endmodule
