//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_carry_lookahead_adder_4bit;
    reg [3:0] A, B;
    reg       Cin;
    wire [3:0] Sum;
    wire       Cout;

    carry_lookahead_adder_4bit u1(
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );
    initial begin
        $dumpfile("cla_4bit.vcd");
        $dumpvars(0, tb_carry_lookahead_adder_4bit);

        $display("Time\tA\tB\tCin\tSum\tCout");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, A, B, Cin, Sum, Cout);
        A = 4'b0000; B = 4'b0000; Cin = 0; #10;
        A = 4'b0001; B = 4'b0010; Cin = 0; #10;
        A = 4'b1010; B = 4'b0101; Cin = 1; #10;
        A = 4'b1111; B = 4'b0001; Cin = 0; #10;
        A = 4'b1111; B = 4'b1111; Cin = 1; #10;
        $finish;
    end
endmodule
