//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module subtractor_4bit (
    input  [3:0] a,       // Minuend
    input  [3:0] b,       // Subtrahend
    output [3:0] diff,    // Result
    output       borrow   // Borrow out (1 if A < B)
);

    wire [4:0] result;

    assign result = {1'b0, a} - {1'b0, b}; // Prevent overflow by extending to 5 bits
    assign diff = result[3:0];
    assign borrow = result[4]; // MSB will be 1 if A < B (borrow occurred)

endmodule
