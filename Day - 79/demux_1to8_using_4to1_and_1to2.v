//T.Guru Nandini devi
//nandinidevitekumudi@gmail.com
// 1:2 DEMUX
module demux_1to2 (
    input din,
    input sel,
    output y0, y1
);
    assign y0 = (~sel) & din;
    assign y1 = sel & din;
endmodule

// 1:4 DEMUX
module demux_1to4 (
    input din,
    input [1:0] sel,
    output y0, y1, y2, y3
);
    assign y0 = (sel == 2'b00) ? din : 1'b0;
    assign y1 = (sel == 2'b01) ? din : 1'b0;
    assign y2 = (sel == 2'b10) ? din : 1'b0;
    assign y3 = (sel == 2'b11) ? din : 1'b0;
endmodule

// 1:8 DEMUX using 2×4:1 and 1×2:1
module demux_1to8_structural (
    input din,
    input [2:0] sel,
    output [7:0] y
);

    wire d0, d1;
    wire [3:0] y_lower, y_upper;

    // First level: 1:2 DEMUX
    demux_1to2 dm2 (
        .din(din),
        .sel(sel[2]),
        .y0(d0),
        .y1(d1)
    );

    // Second level: two 1:4 DEMUXes
    demux_1to4 dm4_0 (
        .din(d0),
        .sel(sel[1:0]),
        .y0(y_lower[0]), .y1(y_lower[1]),
        .y2(y_lower[2]), .y3(y_lower[3])
    );

    demux_1to4 dm4_1 (
        .din(d1),
        .sel(sel[1:0]),
        .y0(y_upper[0]), .y1(y_upper[1]),
        .y2(y_upper[2]), .y3(y_upper[3])
    );

    // Combine outputs
    assign y = {y_upper, y_lower};

endmodule
