//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_t_using_sr;
    reg T, clk;
    wire Q;

    t_using_sr uut (.T(T), .clk(clk), .Q(Q));

    initial begin
        $dumpfile("t_using_sr.vcd");
        $dumpvars(0, tb_t_using_sr);

        $monitor("Time=%0t | T=%b clk=%b | Q=%b", $time, T, clk, Q);

        clk = 0;

        T=0; #10; // Hold
        T=1; #10; // Toggle
        T=1; #10; // Toggle
        T=0; #10; // Hold
        T=1; #10; // Toggle
        T=1; #10; // Toggle

        $finish;
    end

    always #5 clk = ~clk;
endmodule
