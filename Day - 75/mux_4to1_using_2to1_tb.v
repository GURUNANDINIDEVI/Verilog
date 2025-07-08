//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_mux_4to1_using_2to1;

    reg [1:0] sel;
    reg i0, i1, i2, i3;
    wire y;

    mux_4to1_using_2to1 uut (
        .sel(sel), .i0(i0), .i1(i1), .i2(i2), .i3(i3), .y(y)
    );

    initial begin
        {i0, i1, i2, i3} = 4'b1001;

        $display("Sel | Output");
        for (integer i = 0; i < 4; i = i + 1) begin
            sel = i[1:0];
            #5;
            $display(" %b  |   %b", sel, y);
        end
        $finish;
    end

endmodule
