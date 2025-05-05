//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module binary_to_gray (
    input  [3:0] bin,
    output [3:0] gray
);

    assign gray[3] = bin[3];                    // MSB is same
    assign gray[2] = bin[3] ^ bin[2];           // XOR next bits
    assign gray[1] = bin[2] ^ bin[1];
    assign gray[0] = bin[1] ^ bin[0];

endmodule
