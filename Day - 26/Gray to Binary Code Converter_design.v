//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module gray_to_binary (
    input  [3:0] gray,
    output [3:0] bin
);

    assign bin[3] = gray[3];                         // MSB
    assign bin[2] = bin[3] ^ gray[2];                // Next bits
    assign bin[1] = bin[2] ^ gray[1];
    assign bin[0] = bin[1] ^ gray[0];

endmodule
