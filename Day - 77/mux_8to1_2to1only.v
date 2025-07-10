//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
// Basic 2:1 multiplexer
module mux_2to1 (
    input sel,
    input a, b,
    output y
);
    assign y = sel ? b : a;
endmodule

// 8:1 multiplexer using 2:1 muxes only
module mux_8to1_2to1only (
    input [2:0] sel,
    input i0, i1, i2, i3, i4, i5, i6, i7,
    output y
);
    wire m1, m2, m3, m4;
    wire m5, m6;
    wire m7;

    // Level 1 (4 MUXes)
    mux_2to1 m01 (.sel(sel[0]), .a(i0), .b(i1), .y(m1));
    mux_2to1 m02 (.sel(sel[0]), .a(i2), .b(i3), .y(m2));
    mux_2to1 m03 (.sel(sel[0]), .a(i4), .b(i5), .y(m3));
    mux_2to1 m04 (.sel(sel[0]), .a(i6), .b(i7), .y(m4));

    // Level 2 (2 MUXes)
    mux_2to1 m05 (.sel(sel[1]), .a(m1), .b(m2), .y(m5));
    mux_2to1 m06 (.sel(sel[1]), .a(m3), .b(m4), .y(m6));

    // Level 3 (1 MUX)
    mux_2to1 m07 (.sel(sel[2]), .a(m5), .b(m6), .y(m7));

    assign y = m7;

endmodule
