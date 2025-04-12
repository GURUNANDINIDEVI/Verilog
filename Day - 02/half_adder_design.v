//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module half_adder(
    input wire a,    // Input A
    input wire b,    // Input B
    output wire sum, // Sum output
    output wire carry // Carry output
);

assign sum = a ^ b;    // XOR for sum
assign carry = a & b;  // AND for carry

endmodule
