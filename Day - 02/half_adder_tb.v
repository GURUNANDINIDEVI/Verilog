module half_adder_tb;
    reg a;// Inputs
    reg b;// Outputs
    wire sum;
    wire carry;

    // Instantiate the Half Adder
    half_adder u1 (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );
    // Test stimulus
    initial begin
        $display("Time\t a b | sum carry");
        $monitor("%g\t %b %b |  %b     %b", $time, a, b, sum, carry);

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end
endmodule
