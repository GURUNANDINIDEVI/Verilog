//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module half_adder(
    input A, B,
    output Sum, Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule
