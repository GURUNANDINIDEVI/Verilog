//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_square_generator;
  reg  [1:0] a;
  wire [3:0] square;

  square_generator uut (
    .a(a),
    .square(square)
  );

  initial begin
    $display("A\tSquare");
    for (a = 0; a < 4; a = a + 1) begin
      #5;
      $display("%b\t%b", a, square);
    end
    $finish;
  end
endmodule
