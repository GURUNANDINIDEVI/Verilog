//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_half_adder_structural;
    reg A, B;
    wire Sum, Carry;

    half_adder_structural u1 (
        .A(A),
        .B(B),
        .Sum(Sum),
        .Carry(Carry)
    );

    initial begin
        $display("A B | Sum Carry");
        $monitor("%b %b |  %b     %b", A, B, Sum, Carry);

        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;

        $finish;
    end
endmodule
