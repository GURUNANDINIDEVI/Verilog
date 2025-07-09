//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
// 2:1 MUX
module mux_2to1 (
    input sel,
    input a, b,
    output y
);
    assign y = sel ? b : a;
endmodule

// 4:1 MUX
module mux_4to1 (
    input [1:0] sel,
    input i0, i1, i2, i3,
    output y
);
    assign y = (sel == 2'b00) ? i0 :
               (sel == 2'b01) ? i1 :
               (sel == 2'b10) ? i2 :
                                i3;
endmodule

// 8:1 MUX using 2 x 4:1 and 1 x 2:1
module mux_8to1_structural (
    input [2:0] sel,
    input i0, i1, i2, i3, i4, i5, i6, i7,
    output y
);

    wire y0, y1;

    // First 4:1 MUX for i0–i3
    mux_4to1 m0 (
        .sel(sel[1:0]),
        .i0(i0), .i1(i1), .i2(i2), .i3(i3),
        .y(y0)
    );

    // Second 4:1 MUX for i4–i7
    mux_4to1 m1 (
        .sel(sel[1:0]),
        .i0(i4), .i1(i5), .i2(i6), .i3(i7),
        .y(y1)
    );

    // Final 2:1 MUX
    mux_2to1 m2 (
        .sel(sel[2]),
        .a(y0),
        .b(y1),
        .y(y)
    );

endmodule
