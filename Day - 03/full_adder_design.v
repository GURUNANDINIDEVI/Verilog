module full_adder(
    input wire A,       // Input A
    input wire B,       // Input B
    input wire Cin,     // Input Carry (Cin)
    output wire Sum,    // Sum output
    output wire Cout    // Carry output (Cout)
);

assign Sum = A ^ B ^ Cin;      // Sum is the XOR of A, B, and Cin
assign Cout = (A & B) | (Cin & (A ^ B)); // Carry is the OR of (A AND B) and (Cin AND (A XOR B))

endmodule
