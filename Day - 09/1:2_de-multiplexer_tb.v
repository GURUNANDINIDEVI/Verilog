module tb_demux_1to2;
    // Testbench signals
    reg din;
    reg sel;
    wire y0, y1;
    // Instantiate the Demux
    demux_1to2 uut (
        .din(din),
        .sel(sel),
        .y0(y0),
        .y1(y1)
    );
    initial begin
        $display("Time\t sel din | y0 y1");
        $monitor("%g\t  %b   %b  | %b  %b", $time, sel, din, y0, y1);
        // Test all input combinations
        din = 0; sel = 0; #10;
        din = 1; sel = 0; #10;
        din = 0; sel = 1; #10;
        din = 1; sel = 1; #10;
        $finish;
    end
endmodule
