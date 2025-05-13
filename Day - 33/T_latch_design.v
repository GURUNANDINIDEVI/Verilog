//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module t_latch (
    input T,     // Toggle input
    input clk,   // Clock input (used as enable here)
    output reg Q // Output
);

always @(clk or T) begin
    if (clk) begin
        if (T)
            Q <= ~Q;
        else
            Q <= Q;
    end
end
endmodule
