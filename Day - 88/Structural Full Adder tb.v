//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_full_adder_structural;
    reg A, B, Cin;
    wire Sum, Cout;

    full_adder_structural u1 (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        $display("A B Cin | Sum Cout");
        $monitor("%b %b  %b  |  %b    %b", A, B, Cin, Sum, Cout);

        A = 0; B = 0; Cin = 0; #10;
        A = 0; B = 1; Cin = 0; #10;
        A = 1; B = 0; Cin = 0; #10;
        A = 1; B = 1; Cin = 0; #10;
        A = 0; B = 0; Cin = 1; #10;
        A = 0; B = 1; Cin = 1; #10;
        A = 1; B = 0; Cin = 1; #10;
        A = 1; B = 1; Cin = 1; #10;

        $finish;
    end
endmodule
