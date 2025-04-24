//T.Guru Nandini Devi
//Nandinidevitekumudi@gmail.com
module parity_generator (
    input [3:0] data_in,
    output parity_bit
);

    // Even parity: XOR all bits
    assign parity_bit = ^data_in;

endmodule
