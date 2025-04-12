//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_decoder_2to4;

    reg [1:0] in;
    reg en;
    wire [3:0] out;

    // Instantiate the Decoder
    decoder_2to4 uut (
        .in(in),
        .en(en),
        .out(out)
    );

    initial begin
        $display("Time\t en in | out");
        $monitor("%g\t %b  %b  | %b", $time, en, in, out);

        // Test with enable OFF
        en = 0; in = 2'b00; #10;
        in = 2'b01; #10;

        // Test with enable ON
        en = 1; in = 2'b00; #10;
        in = 2'b01; #10;
        in = 2'b10; #10;
        in = 2'b11; #10;

        $finish;
    end

endmodule
