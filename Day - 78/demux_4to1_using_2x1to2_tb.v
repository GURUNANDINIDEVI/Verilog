//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_demux_1to4_using_1to2;

    reg din;
    reg [1:0] sel;
    wire y0, y1, y2, y3;

    demux_1to4_using_1to2 dut (
        .din(din),
        .sel(sel),
        .y0(y0),
        .y1(y1),
        .y2(y2),
        .y3(y3)
    );

    initial begin
        $display("Sel  | din | y0 y1 y2 y3");
        din = 1;

        for (integer i = 0; i < 4; i = i + 1) begin
            sel = i[1:0];
            #5;
            $display(" %b  |  %b  | %b  %b  %b  %b", sel, din, y0, y1, y2, y3);
        end

        $finish;
    end

endmodule
