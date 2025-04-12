
//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module full_adder_tb;
    reg a;// Inputs
    reg b;
    reg cin;
    wire sum;// Outputs
    wire cout;
    // Instantiate the Full Adder
    full_adder u1 (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Test stimulus
    initial begin
        $display("Time\t a b cin | sum cout");
        $monitor("%g\t %b %b  %b  |  %b    %b", $time, a, b, cin, sum, cout);

        a = 0; b = 0; cin = 0; #10;
        a = 0; b = 0; cin = 1; #10;
        a = 0; b = 1; cin = 0; #10;
        a = 0; b = 1; cin = 1; #10;
        a = 1; b = 0; cin = 0; #10;
        a = 1; b = 0; cin = 1; #10;
        a = 1; b = 1; cin = 0; #10;
        a = 1; b = 1; cin = 1; #10;

        $finish;
    end
endmodule
