////T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_tristate_buffer;
  reg in;
  reg enable;
  wire out;

  tristate_buffer uut (
    .in(in),
    .enable(enable),
    .out(out)
  );

  initial begin
    $display("Time\tEnable\tInput\tOutput");
    $monitor("%0t\t%b\t%b\t%b", $time, enable, in, out);

    in = 1'b0; enable = 1'b0; #10;
    in = 1'b1; enable = 1'b0; #10;
    in = 1'b1; enable = 1'b1; #10;
    in = 1'b0; enable = 1'b1; #10;
    in = 1'b1; enable = 1'b0; #10;

    $finish;
  end
endmodule
