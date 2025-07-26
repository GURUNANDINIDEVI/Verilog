//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_sr_using_dff;
    reg clk, S, R;
    wire Q;

    sr_using_dff uut (.clk(clk), .S(S), .R(R), .Q(Q));

    initial begin
        $dumpfile("sr_from_dff.vcd");
        $dumpvars(0, tb_sr_using_dff);
        $display("Time\tS R\tQ");
        $monitor("%0t\t%b %b\t%b", $time, S, R, Q);

        clk = 0; S = 0; R = 0;
        #5 S = 1; R = 0; // Set
        #5 clk = 1; #5 clk = 0;
        #5 S = 0; R = 1; // Reset
        #5 clk = 1; #5 clk = 0;
        #5 S = 0; R = 0; // Hold
        #5 clk = 1; #5 clk = 0;
        #5 S = 1; R = 1; // Invalid
        #5 clk = 1; #5 clk = 0;

        #10 $finish;
    end

    always #2.5 clk = ~clk;
endmodule
