//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module demux_1to2 (
    input wire din,        // Data input
    input wire sel,        // Select line
    output wire y0,        // Output 0
    output wire y1         // Output 1
);

assign y0 = (~sel) & din;
assign y1 = sel & din;

endmodule

