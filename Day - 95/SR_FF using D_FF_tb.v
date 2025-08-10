//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_sr_using_d;
    reg S, R, clk;
    wire Q;

    sr_using_d uut (.S(S), .R(R), .clk(clk), .Q(Q));

    initial begin
        $monitor("Time=%0t | S=%b R=%b clk=%b | Q=%b", $time, S, R, clk, Q);
        clk = 0;
        
        // Test sequence
        S=0; R=0; #10; // No change
        S=1; R=0; #10; // Set
        S=0; R=0; #10; // Hold
        S=0; R=1; #10; // Reset
        S=1; R=1; #10; // Invalid

        $finish;
    end

    always #5 clk = ~clk; // 10-time unit clock
endmodule
