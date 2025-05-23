//T.Guru Nandini Devi
//Nandinidevitekumudi@gmail.com
module carry_lookahead_adder_4bit (
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output [3:0] Sum,
    output       Cout
);
    wire [3:0] G, P;   // Generate and Propagate
    wire [4:0] C;      // Carry (C[0] = Cin)
    assign C[0] = Cin;
    // Generate and Propagate
    assign G = A & B;
    assign P = A ^ B;
    // Carry Lookahead Logic
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
    assign C[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) |
                  (P[3] & P[2] & P[1] & P[0] & C[0]);
    // Sum
    assign Sum = P ^ C[3:0];
    assign Cout = C[4];

endmodule
