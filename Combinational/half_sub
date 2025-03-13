module half_subtractor (
    input wire A, // Minuend
    input wire B, // Subtrahend
    output wire Difference, // Difference output
    output wire Borrow // Borrow output
);
assign Difference = A ^ B;
assign Borrow = (~A) & B;
endmodule
