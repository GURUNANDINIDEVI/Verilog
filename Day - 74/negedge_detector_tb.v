//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_negedge_detector;

    reg clk, signal_in;
    wire negedge_detected;

    // Instantiate the detector
    negedge_detector dut (
        .clk(clk),
        .signal_in(signal_in),
        .negedge_detected(negedge_detected)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        signal_in = 1;

        // Simulate input signal
        #10 signal_in = 0;  // negedge here
        #10 signal_in = 1;
        #20 signal_in = 0;  // another negedge
        #10 signal_in = 0;
        #10 signal_in = 1;

        #20 $finish;
    end

    initial begin
        $display("Time\tSignal_in\tNegEdge");
        $monitor("%t\t%b\t\t%b", $time, signal_in, negedge_detected);
    end

endmodule
