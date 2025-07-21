//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
// AND gate module
module and_gate(
    input a, b,
    output y
);
    assign y = a & b;
endmodule

// XOR gate module
module xor_gate(
    input a, b,
    output y
);
    assign y = a ^ b;
endmodule

// Half Adder module using AND and XOR gate modules
module half_adder_structural(
    input A, B,
    output Sum, Carry
);

    // Instantiate XOR gate for Sum
    xor_gate u1 (
        .a(A),
        .b(B),
        .y(Sum)
    );

    // Instantiate AND gate for Carry
    and_gate u2 (
        .a(A),
        .b(B),
        .y(Carry)
    );

endmodule
