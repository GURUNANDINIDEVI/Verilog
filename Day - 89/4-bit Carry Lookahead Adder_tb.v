//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_cla_4bit;
    reg  [3:0] A, B;
    reg        Cin;
    wire [3:0] Sum;
    wire       Cout;

    cla_4bit uut (
        .A(A), .B(B), .Cin(Cin),
        .Sum(Sum), .Cout(Cout)
    );

    initial begin
        $display("A     B     Cin | Sum   Cout");
        $monitor("%b  %b   %b   | %b    %b", A, B, Cin, Sum, Cout);

        A = 4'b0000; B = 4'b0000; Cin = 0; #10;
        A = 4'b0011; B = 4'b0101; Cin = 0; #10;
        A = 4'b1111; B = 4'b0001; Cin = 0; #10;
        A = 4'b1001; B = 4'b0110; Cin = 1; #10;
        A = 4'b1111; B = 4'b1111; Cin = 1; #10;

        $finish;
    end
endmodule
