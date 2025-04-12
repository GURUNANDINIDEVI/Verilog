//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module and_gate_tb;
    // Inputs
    reg a;
    reg b;
    // Output
    wire y;
  // Instantiate the AND gate
    and_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );
    initial begin
        $display("Time\t a b | y");
        $monitor("%g\t %b %b | %b", $time, a, b, y);
  // Test all input combinations
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        $finish;
    end
endmodule
