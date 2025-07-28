//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_jk_using_d;
    reg clk, J, K;
    wire Q;

    jk_using_d uut (.clk(clk), .J(J), .K(K), .Q(Q));

    initial begin
        $dumpfile("jk_using_d.vcd");
        $dumpvars(0, tb_jk_using_d);
        $display("Time\tJ K\tQ");
        $monitor("%0t\t%b %b\t%b", $time, J, K, Q);

        clk = 0; J = 0; K = 0;

        #5  J = 1; K = 0;  // Set
        #10 J = 0; K = 0;  // Hold
        #10 J = 0; K = 1;  // Reset
        #10 J = 1; K = 1;  // Toggle
        #10 J = 1; K = 1;  // Toggle again
        #10 $finish;
    end

    always #5 clk = ~clk;
endmodule
