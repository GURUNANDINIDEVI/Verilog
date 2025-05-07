//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module t_flip_flop (
    input clk,
    input rst,     // Asynchronous active-high reset
    input t,
    output reg q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;                // Reset output
        else if (t)
            q <= ~q;                  // Toggle output if T=1
        else
            q <= q;                   // Hold current state
    end
endmodule
