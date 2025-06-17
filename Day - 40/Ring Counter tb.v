// T.Guru Nandini Devi
// nandinidevitekumudi@gmail.com

// Testbench for Ring Counter
module tb_ring_counter;

    // Declare signals
    reg clk;
    reg rst;
    wire [3:0] out;

    // Instantiate Ring Counter
    ring_counter u1(
        .clk(clk),
        .rst(rst),
        .out(out)
    );

    // Clock generation with 10ns period
    always #5 clk = ~clk;

    // Monitor signals at each clock pulse
    always @(posedge clk) begin
        $display("Time = %t | reset = %b | out = %b",$time, rst, out);
    end

    initial begin
        // Dump signals for waveform view
        $dumpfile("ring_counter.vcd");

        $dumpvars(0, tb_ring_counter);

        // Initial reset
        clk = 0;
        rst = 1;

        // Release reset after 10 ns
        #10
        rst = 0;

        // Let it run for 8 clock cycles
        #80
        $finish;
    end

endmodule
