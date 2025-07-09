//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_mux_8to1_structural;

    reg [2:0] sel;
    reg i0, i1, i2, i3, i4, i5, i6, i7;
    wire y;

    mux_8to1_structural uut (
        .sel(sel),
        .i0(i0), .i1(i1), .i2(i2), .i3(i3),
        .i4(i4), .i5(i5), .i6(i6), .i7(i7),
        .y(y)
    );

    initial begin
        {i0, i1, i2, i3, i4, i5, i6, i7} = 8'b11001011;

        $display("Sel | Output");
        for (integer i = 0; i < 8; i = i + 1) begin
            sel = i[2:0];
            #5;
            $display(" %b  |   %b", sel, y);
        end
        $finish;
    end

endmodule
