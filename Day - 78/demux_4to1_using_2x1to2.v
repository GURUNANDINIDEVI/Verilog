//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com

module demux_1to2 (
    input din,
    input sel,
    output y0,
    output y1
);
    assign y0 = (~sel) & din;
    assign y1 = sel & din;
endmodule

// 4:1 DEMUX using two 1:2 DEMUXes and logic
module demux_1to4_using_1to2 (
    input din,
    input [1:0] sel,
    output y0, y1, y2, y3
);
    wire d0, d1;

    // First DEMUX splits based on sel[1]
    demux_1to2 dmx1 (
        .din(din),
        .sel(sel[1]),
        .y0(d0),
        .y1(d1)
    );

    // Second-level DEMUXes split d0 and d1 based on sel[0]
    demux_1to2 dmx2 (
        .din(d0),
        .sel(sel[0]),
        .y0(y0),
        .y1(y1)
    );

    demux_1to2 dmx3 (
        .din(d1),
        .sel(sel[0]),
        .y0(y2),
        .y1(y3)
    );

endmodule
