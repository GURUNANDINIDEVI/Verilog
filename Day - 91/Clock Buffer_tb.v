//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_clock_buffer;
  reg clk_in;
  wire clk_out;

  clock_buffer uut (
    .clk_in(clk_in),
    .clk_out(clk_out)
  );

  // Clock generator
  initial begin
    clk_in = 0;
    forever #5 clk_in = ~clk_in;  // 10ns clock period
  end

  // Monitor output
  initial begin
    $display("Time\tclk_in\tclk_out");
    $monitor("%0t\t%b\t%b", $time, clk_in, clk_out);
    #50 $finish;
  end
endmodule
