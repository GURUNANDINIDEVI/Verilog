//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module adder_4bit (
    input  [3:0] a,         // 4-bit input A
    input  [3:0] b,         // 4-bit input B
    input        cin,       // Carry-in
    output [3:0] sum,       // 4-bit sum output
    output       cout       // Carry-out
);

    assign {cout, sum} = a + b + cin;

endmodule
