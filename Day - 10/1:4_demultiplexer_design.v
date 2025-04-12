//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module demux_1to4 (
    input wire din,              // Data input
    input wire [1:0] sel,        // 2-bit Select line
    output wire [3:0] y          // 4 outputs
);

assign y[0] = (~sel[1] & ~sel[0]) & din;
assign y[1] = (~sel[1] &  sel[0]) & din;
assign y[2] = ( sel[1] & ~sel[0]) & din;
assign y[3] = ( sel[1] &  sel[0]) & din;

endmodule
