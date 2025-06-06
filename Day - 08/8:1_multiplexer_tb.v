//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_mux_8to1;
reg [2:0] sel;
reg [7:0] in;
wire y;
// Instantiate the DUT
mux_8to1 u1 (
    .sel(sel),
    .in(in),
    .y(y)
);
// Waveform generation
initial begin
    $dumpfile("mux_8to1.vcd");
    $dumpvars(0, tb_mux_8to1);
end
initial begin
    $display("Time\t sel  in       | y");
    $monitor("%g\t %b  %b | %b", $time, sel, in, y);
    // Set inputs
    in = 8'b11010110;
    // Test all select values
    sel = 3'b000; #10;
    sel = 3'b001; #10;
    sel = 3'b010; #10;
    sel = 3'b011; #10;
    sel = 3'b100; #10;
    sel = 3'b101; #10;
    sel = 3'b110; #10;
    sel = 3'b111; #10;
    $finish;
end
endmodule
