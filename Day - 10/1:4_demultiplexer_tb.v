//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_demux_1to4;
    reg din;
    reg [1:0] sel;
    wire [3:0] y;
    // Instantiate the DUT
    demux_1to4 u1 (
        .din(din),
        .sel(sel),
        .y(y)
    );
    initial begin
        $display("Time\t sel din | y[3] y[2] y[1] y[0]");
        $monitor("%g\t %b   %b  |   %b     %b     %b     %b", 
                  $time, sel, din, y[3], y[2], y[1], y[0]);
        // Test all combinations
        din = 0; sel = 2'b00; #10;
        din = 1; sel = 2'b00; #10;
        din = 1; sel = 2'b01; #10;
        din = 1; sel = 2'b10; #10;
        din = 1; sel = 2'b11; #10;
        din = 0; sel = 2'b11; #10;
        $finish;
    end
endmodule
