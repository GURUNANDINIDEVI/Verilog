//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module d_flip_flop (
    input clk,
    input rst,     // Asynchronous active-high reset
    input d,
    output reg q
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;         // Reset Q to 0
        else
            q <= d;            // Latch D on clock edge
    end

endmodule
