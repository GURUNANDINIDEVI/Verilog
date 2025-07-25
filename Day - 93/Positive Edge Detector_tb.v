//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module pos_edge_detector_tb;

    reg clk;
    reg rst;
    reg signal_in;
    wire pos_edge;

    // Instantiate the module
    pos_edge_detector uut (
        .clk(clk),
        .rst(rst),
        .signal_in(signal_in),
        .pos_edge(pos_edge)
    );

    // Clock generation
    always #5 clk = ~clk;  // 10 time unit clock period

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        signal_in = 0;

        // Apply reset
        #10 rst = 0;

        // Stimulus
        #10 signal_in = 0;  // No edge
        #10 signal_in = 1;  // Rising edge → pos_edge = 1
        #10 signal_in = 1;  // No edge
        #10 signal_in = 0;  // Falling edge → pos_edge = 0
        #10 signal_in = 1;  // Rising edge → pos_edge = 1
        #10 signal_in = 0;  // Falling edge
        #10 signal_in = 0;  // No edge
        #10 $finish;
    end

    // Monitor
    initial begin
        $monitor("Time=%0t | signal_in=%b | pos_edge=%b", $time, signal_in, pos_edge);
    end

endmodule
