//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module exor_gate_tb;
    reg a;         // Inputs
    reg b;
    wire y;        // Output
    // Instantiate the XOR gate
    exor_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );
    // Test stimulus
    initial begin
        $display("Time\t a b | y");
        $monitor("%g\t %b %b | %b", $time, a, b, y);
        // Test all combinations
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        $finish;
    end
endmodule
