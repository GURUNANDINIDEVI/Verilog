//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module half_subtractor_tb;
    // Inputs
    reg a;
    reg b;
   // Outputs
    wire difference;
    wire borrow;

    // Instantiate the Half Subtractor
    half_subtractor u1 (
        .a(a),
        .b(b),
      .difference(difference),
        .borrow(borrow)
    );

    // Test stimulus
    initial begin
      $display("Time\t a b | difference borrow");
      $monitor("%g\t %b %b |   %b     %b", $time, a, b, difference, borrow);

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end
endmodule
