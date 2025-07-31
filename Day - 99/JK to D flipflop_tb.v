//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_d_using_jk;
    reg clk, D;
    wire Q;

    d_using_jk uut (.clk(clk), .D(D), .Q(Q));

    initial begin
        $dumpfile("d_using_jk.vcd");
        $dumpvars(0, tb_d_using_jk);
        $display("Time\tD\tQ");
        $monitor("%0t\t%b\t%b", $time, D, Q);

        clk = 0; D = 0;

        #5  D = 1;
        #10 D = 0;
        #10 D = 1;
        #10 D = 1;
        #10 D = 0;
        #10 $finish;
    end

    always #5 clk = ~clk;
endmodule
