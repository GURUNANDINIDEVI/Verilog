//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module half_adder(
    input wire a,    // Input a
    input wire b,    // Input b
    output wire sum, // sum output
    output wire carry //carry output
);

assign sum = a ^ b;    // XOR for sum
assign carry = a & b;  // AND for carry

endmodule
