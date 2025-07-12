//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_demux_1to8_structural;

    reg din;
    reg [2:0] sel;
    wire [7:0] y;

    demux_1to8_structural uut (
        .din(din),
        .sel(sel),
        .y(y)
    );

    initial begin
        $display("sel | din | y[7:0]");
        din = 1;
        for (integer i = 0; i < 8; i = i + 1) begin
            sel = i;
            #5;
            $display("%03b |  %b  | %b", sel, din, y);
        end
        $finish;
    end

endmodule
