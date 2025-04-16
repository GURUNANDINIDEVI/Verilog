//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_encoder_8to3;
    reg [7:0] in;
    wire [2:0] out;

    encoder_8to3 u1(
        .in(in),
        .out(out)
    );

    initial begin
        $dumpfile("encoder_8to3.vcd");
        $dumpvars(0, tb_encoder_8to3);

        $display("Time\t\tInput\t\tOutput");
        $monitor("%0t\t%b\t%b", $time, in, out);

        in = 8'b00000001; #10;
        in = 8'b00000010; #10;
        in = 8'b00000100; #10;
        in = 8'b00001000; #10;
        in = 8'b00010000; #10;
        in = 8'b00100000; #10;
        in = 8'b01000000; #10;
        in = 8'b10000000; #10;
        in = 8'b00000000; #10;  // Invalid case
        in = 8'b10101000; #10;  // Priority goes to bit 7

        $finish;
    end
endmodule
