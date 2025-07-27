//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_t_using_sr;
    reg clk, T;
    wire Q;

    t_using_sr uut (.clk(clk), .T(T), .Q(Q));

    initial begin
        $dumpfile("t_using_sr.vcd");
        $dumpvars(0, tb_t_using_sr);
        $display("Time\tT\tQ");
        $monitor("%0t\t%b\t%b", $time, T, Q);

        clk = 0; T = 0;
        #5 T = 1;
        #10 T = 0;
        #10 T = 1;
        #10 T = 1;
        #10 T = 0;
        #10 $finish;
    end

    always #5 clk = ~clk;
endmodule
