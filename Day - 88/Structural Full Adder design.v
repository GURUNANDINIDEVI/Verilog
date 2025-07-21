//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module half_adder(
    input A, B,
    output Sum, Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule

module or_gate(
    input A, B,
    output Y
);
    assign Y = A | B;
endmodule

module full_adder_structural(
    input A, B, Cin,
    output Sum, Cout
);
    wire sum1, carry1, carry2;

    // First Half Adder
    half_adder HA1 (
        .A(A),
        .B(B),
        .Sum(sum1),
        .Carry(carry1)
    );

    // Second Half Adder
    half_adder HA2 (
        .A(sum1),
        .B(Cin),
        .Sum(Sum),
        .Carry(carry2)
    );

    // OR gate for final carry
    or_gate OR1 (
        .A(carry1),
        .B(carry2),
        .Y(Cout)
    );

endmodule

