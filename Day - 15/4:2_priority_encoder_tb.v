//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_priority_encoder_4to2;
    reg [3:0] in;
    wire [1:0] out;
    priority_encoder_4to2 u1(
        .in(in),
        .out(out)
    );
    initial begin
        $dumpfile("priority_encoder_4to2.vcd");
        $dumpvars(0, tb_priority_encoder_4to2);

        $display("Time\tInput\tOutput");
        $monitor("%0t\t%b\t%b", $time, in, out);

        in = 4'b0001; #10;  // Output: 00
        in = 4'b0010; #10;  // Output: 01
        in = 4'b0100; #10;  // Output: 10
        in = 4'b1000; #10;  // Output: 11

        in = 4'b0011; #10;  // Output: 01 (higher priority: in[1])
        in = 4'b0110; #10;  // Output: 10 (in[2])
        in = 4'b1111; #10;  // Output: 11 (in[3])
        in = 4'b0000; #10;  // Output: xx (no input high)
        $finish;
    end
endmodule
