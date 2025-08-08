//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_d_flipflop_using_sr;
    reg D, clk;
    wire Q;

    d_flipflop_using_sr dut (.D(D), .clk(clk), .Q(Q));

    initial begin
        $monitor("Time=%0t | D=%b | clk=%b | Q=%b", $time, D, clk, Q);
        clk = 0;
        D = 0;
        #5 D = 1;
        #10 D = 0;
        #10 D = 1;
        #10 $finish;
    end

    always #5 clk = ~clk; // Clock with 10 time unit period
endmodule
