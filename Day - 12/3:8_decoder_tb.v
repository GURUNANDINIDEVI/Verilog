//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_decoder_3to8;
    reg [2:0] in;
    reg en;
    wire [7:0] out;
    // Instantiate the behavioral decoder
    decoder_3to8 u1 (
        .in(in),
        .en(en),
        .out(out)
    );

    initial begin
        $dumpfile("decoder_3to8.vcd");  // For GTKWave
        $dumpvars(0, tb_decoder_3to8);

        $display("Time\t en in  | out");
        $monitor("%g\t %b  %b | %b", $time, en, in, out);

        // Test with enable = 0
        en = 0; in = 3'b000; #10;
        in = 3'b101; #10;
        // Test with enable = 1
        en = 1;
        in = 3'b000; #10;
        in = 3'b001; #10;
        in = 3'b010; #10;
        in = 3'b011; #10;
        in = 3'b100; #10;
        in = 3'b101; #10;
        in = 3'b110; #10;
        in = 3'b111; #10;

        $finish;
    end

endmodule
