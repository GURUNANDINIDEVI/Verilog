//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_d_latch;
    reg d, en, rst;
    wire q;
    // Instantiate the D latch
  d_latch u1(.d(d),.en(en),.rst(rst),.q(q));
    initial begin
        $dumpfile("d_latch.vcd");
        $dumpvars(0, tb_d_latch);
    end
    // Apply test stimulus
    initial begin
        $display("Time\td\ten\trst\tq");
        $monitor("%0dns\t%b\t%b\t%b\t%b", $time, d, en, rst, q);
        // Reset active
        d = 0; en = 0; rst = 1; #10;
        // Deassert reset, latch enabled
        rst = 0; d = 1; en = 1; #10;
        // Change D with EN = 1
        d = 0; #10;
        // Disable latch
        en = 0; d = 1; #10;
        // Re-enable latch
        en = 1; #10;
        // Reset again
        rst = 1; #10;
        $finish;
    end

endmodule
