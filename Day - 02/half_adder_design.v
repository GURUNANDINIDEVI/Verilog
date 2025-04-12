//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module half_adder(
    input wire A,    // Input A
    input wire B,    // Input B
    output wire Sum, // Sum output
    output wire Carry // Carry output
);

assign Sum = A ^ B;    // XOR for sum
assign Carry = A & B;  // AND for carry

endmodule
