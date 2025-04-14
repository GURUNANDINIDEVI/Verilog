module tb_encoder_4to2;

    reg [3:0] in;
    wire [1:0] out;

    // Instantiate the encoder
    encoder_4to2 u1 (
        .in(in),
        .out(out)
    );

    initial begin
        $dumpfile("encoder_4to2.vcd");     // For GTKWave
        $dumpvars(0, tb_encoder_4to2);     // Dump all signals

        $display("Time\t in   | out");
        $monitor("%g\t %b | %b", $time, in, out);

        in = 4'b0001; #10;  // Expect 00
        in = 4'b0010; #10;  // Expect 01
        in = 4'b0100; #10;  // Expect 10
        in = 4'b1000; #10;  // Expect 11

        // Invalid cases (for testing default)
        in = 4'b0000; #10;  // Expect 00
        in = 4'b1100; #10;  // Expect 00

        $finish;
    end

endmodule
