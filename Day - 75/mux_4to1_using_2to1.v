//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module mux_2to1 (
    input sel,
    input a, b,
    output y
);
    assign y = sel ? b : a;
endmodule

module mux_4to1_using_2to1 (
    input [1:0] sel,
    input i0, i1, i2, i3,
    output y
);
    wire y0, y1;

    // First stage (2 MUXes)
    mux_2to1 m0 (.sel(sel[0]), .a(i0), .b(i1), .y(y0));
    mux_2to1 m1 (.sel(sel[0]), .a(i2), .b(i3), .y(y1));

    // Second stage (1 MUX)
    mux_2to1 m2 (.sel(sel[1]), .a(y0), .b(y1), .y(y));
endmodule
