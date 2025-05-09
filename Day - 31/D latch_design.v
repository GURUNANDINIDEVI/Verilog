//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module d_latch (
    input d,
    input en,     // Enable signal
    input rst,    // Asynchronous reset
    output reg q
);

    always @(*) begin
        if (rst)
            q <= 1'b0;          // Reset output
        else if (en)
            q <= d;             // Transparent latch when enabled
        // else retain previous value
    end

endmodule
