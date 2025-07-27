//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_sr_using_t;
    reg clk, S, R;
    wire Q;

    sr_using_t uut (.clk(clk), .S(S), .R(R), .Q(Q));

    initial begin
        $dumpfile("sr_using_t.vcd");
        $dumpvars(0, tb_sr_using_t);
        $display("Time\tS R\tQ");
        $monitor("%0t\t%b %b\t%b", $time, S, R, Q);

        clk = 0; S = 0; R = 0;

        #5  S = 1; R = 0;  // Set
        #10 S = 0; R = 0;  // Hold
        #10 S = 0; R = 1;  // Reset
        #10 S = 0; R = 0;  // Hold
        #10 S = 1; R = 1;  // Invalid - treated as Hold
        #10 $finish;
    end

    always #5 clk = ~clk;
endmodule
