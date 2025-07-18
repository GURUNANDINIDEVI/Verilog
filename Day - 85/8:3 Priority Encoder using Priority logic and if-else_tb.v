//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_priority_encoder_8to3;
    reg [7:0] D;
    wire [2:0] Y;
    wire valid;

    priority_encoder_8to3 uut (
        .D(D),
        .Y(Y),
        .valid(valid)
    );

    initial begin
        $display("Input      | Output | Valid");
        D = 8'b00000000; #5; $display("%b |  %b   |  %b", D, Y, valid);
        D = 8'b00000001; #5; $display("%b |  %b   |  %b", D, Y, valid);
        D = 8'b00000100; #5; $display("%b |  %b   |  %b", D, Y, valid);
        D = 8'b10000000; #5; $display("%b |  %b   |  %b", D, Y, valid);
        D = 8'b01010101; #5; $display("%b |  %b   |  %b", D, Y, valid);
        D = 8'b11110000; #5; $display("%b |  %b   |  %b", D, Y, valid);
        D = 8'b00010010; #5; $display("%b |  %b   |  %b", D, Y, valid);
        $finish;
    end
endmodule
