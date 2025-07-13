//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module half_adder (
    input a, b,
    output sum, carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule
module full_adder_using_half_adders (
    input a, b, cin,
    output sum, cout
);
    wire s1, c1, c2;

    // First half adder
    half_adder ha1 (
        .a(a),
        .b(b),
        .sum(s1),
        .carry(c1)
    );

    // Second half adder
    half_adder ha2 (
        .a(s1),
        .b(cin),
        .sum(sum),
        .carry(c2)
    );

    // OR gate for carry out
    assign cout = c1 | c2;
endmodule
