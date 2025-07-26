//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_d_ff_using_sr;
    reg clk, D;
    wire Q;

    d_ff_using_sr uut (.clk(clk), .D(D), .Q(Q));

    initial begin
        $display("Time\tClk\tD\tQ");
        $monitor("%0t\t%b\t%b\t%b", $time, clk, D, Q);

        clk = 0; D = 0;

        #5 D = 1;
        #5 clk = 1; #5 clk = 0;

        #5 D = 0;
        #5 clk = 1; #5 clk = 0;

        #5 D = 1;
        #5 clk = 1; #5 clk = 0;

        #5 $finish;
    end

    // Clock toggle
    always #2.5 clk = ~clk;
endmodule
