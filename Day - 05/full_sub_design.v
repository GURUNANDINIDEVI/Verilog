module full_subtractor (
    input A,       // Minuend
    input B,       // Subtrahend
    input Bin,     // Borrow-in
    output Diff,   // Difference
    output Bout    // Borrow-out
);

    assign Diff = A ^ B ^ Bin;
    assign Bout = (~A & B) | (~A & Bin) | (B & Bin);
    
endmodule
