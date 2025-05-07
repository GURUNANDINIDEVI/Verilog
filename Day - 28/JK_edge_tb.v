//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
// tb_jk_flipflop.v
module tb_jk_flipflop;
    reg clk, reset, J, K;
    wire Q;
    jk_flipflop u1(.clk(clk),.reset(reset),.J(J),.K(K),.Q(Q));
    // Clock generation
    always #5 clk = ~clk;
    initial begin
        // Initialize
        clk = 0;
        reset = 1;
        J = 0;
        K = 0;
        // Reset pulse
        #10 reset = 0;
        // Test various input combinations
        #10 J = 0; K = 0;  // No change
        #10 J = 0; K = 1;  // Reset
        #10 J = 1; K = 0;  // Set
        #10 J = 1; K = 1;  // Toggle
        #10 J = 0; K = 1;  // Reset
        #10 J = 1; K = 1;  // Toggle

        #20 $finish;
    end
endmodule
