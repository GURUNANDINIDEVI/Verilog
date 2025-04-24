//T.Guru Nandini Devi
//Nandinidevitekumudi@gmail.com
module parity_checker (
    input [3:0] data_in,
    input parity_bit,
    output error_flag
);

    // Even parity: XOR of all bits including parity bit must be 0
    assign error_flag = ^{data_in, parity_bit};

endmodule
