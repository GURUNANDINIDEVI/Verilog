//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module mux_8to1 (
    input wire [2:0] sel,         // 3-bit select line
    input wire [7:0] in,          // 8 inputs: in[0] to in[7]
    output wire y                 // Output
);
assign y = in[sel];  // Select input based on sel
endmodule
