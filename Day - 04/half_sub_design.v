module half_subtractor (
    input wire a, // Minuend
    input wire b, // Subtrahend
    output wire difference, // Difference output
    output wire borrow // Borrow output
);
assign difference = a ^ b;
    assign borrow = (~a) & b;
endmodule
