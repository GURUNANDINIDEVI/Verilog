//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module pos_edge_detector (
    input clk,
    input rst,
    input signal_in,
    output reg pos_edge
);

    reg signal_prev;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            signal_prev <= 0;
            pos_edge <= 0;
        end else begin
            pos_edge <= (~signal_prev) & signal_in;
            signal_prev <= signal_in;
        end
    end
endmodule
