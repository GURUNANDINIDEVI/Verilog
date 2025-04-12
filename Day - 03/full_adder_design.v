//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module full_adder(
    input wire a,       // Input a
    input wire b,       // Input b
    input wire cin,     // Input carry (cin)
    output wire sum,    // sum output
    output wire cout    // carry output (cout)
);

assign Sum = a ^ b ^ cin;      // sum is the XOR of a, b, and cin
    assign Cout = (a & b) | (cin & (a ^ b)); // carry is the OR of (a AND b) and (cin AND (a XOR b))

endmodule
