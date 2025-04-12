module full_subtractor_tb;
    // Inputs
    reg A;
    reg B;
    reg Bin;
    // Outputs
    wire Diff;
    wire Bout;

    // Instantiate the Full Subtractor
    full_subtractor u1 (
        .A(A),
        .B(B),
        .Bin(Bin),
        .Diff(Diff),
        .Bout(Bout)
    );

    // Apply test vectors
    initial begin
        $display("Time\t A B Bin | Diff Bout");
        $monitor("%g\t %b %b  %b  |   %b    %b", $time, A, B, Bin, Diff, Bout);

        // Test all 8 input combinations
        A = 0; B = 0; Bin = 0; #10;
        A = 0; B = 0; Bin = 1; #10;
        A = 0; B = 1; Bin = 0; #10;
        A = 0; B = 1; Bin = 1; #10;
        A = 1; B = 0; Bin = 0; #10;
        A = 1; B = 0; Bin = 1; #10;
        A = 1; B = 1; Bin = 0; #10;
        A = 1; B = 1; Bin = 1; #10;

        $finish;
    end
endmodule
