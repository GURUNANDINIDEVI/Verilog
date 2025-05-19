//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_jk_latch;
    reg J, K, enable, reset;
    wire Q;
    // Instantiate the JK Latch
    jk_latch u1(.J(J),.K(K),.enable(enable),.reset(reset),.Q(Q));
  
    initial begin
        $dumpfile("jk_latch.vcd");    // Output VCD file name
        $dumpvars(0, tb_jk_latch);    // Dump all variables in this module
    end

    // Stimulus block
    initial begin
        $display("Time\tj\tk\ten\trst\tq");
        $monitor("%0dns\t%b\t%b\t%b\t%b\t%b", $time, j,k, en, rst, q);
        // Initialize
        J = 0; K = 0; enable = 0; reset = 1;

        // Deassert reset
        #10 reset = 0;

        #10 enable = 1; J = 0; K = 0;  // No change
        #10 J = 0; K = 1;             // Reset
        #10 J = 1; K = 0;             // Set
        #10 J = 1; K = 1;             // Toggle
        #10 J = 0; K = 1;             // Reset
        #10 J = 1; K = 1;             // Toggle
        #10 enable = 0; J = 1; K = 0; // Latch disabled - no change
        #10 enable = 1; J = 0; K = 0; // Hold state

        #20 $finish;
    end

endmodule
