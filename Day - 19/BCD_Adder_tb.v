//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module BCD_Adder_tb;
    reg [7:0] A, B;
    wire [7:0] SUM;
    wire CO;
    // Instantiate the BCD Adder
    BCD_Adder u1(
        .A(A),
        .B(B),
        .SUM(SUM),
        .CO(CO)
    );
    
    initial begin
        // Test cases
        A = 8'b00000000; B = 8'b00000000; // 0 + 0
        #10 A = 8'b00000001; B = 8'b00000001; // 1 + 1
        #10 A = 8'b00001001; B = 8'b00000001; // 9 + 1
        #10 A = 8'b00001001; B = 8'b00001001; // 9 + 9
        #10 A = 8'b00001100; B = 8'b00000100; // 12 + 4
        
        // End simulation
        #10 $finish;
    end
    
    initial begin
        $monitor("Time: %0d, A: %b, B: %b, SUM: %b, CO: %b", $time, A, B, SUM, CO);
    end
endmodule
