//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module negedge_detector (
    input clk,
    input signal_in,
    output reg negedge_detected
);

    reg signal_d;  // Delayed signal

    always @(posedge clk) begin
        signal_d <= signal_in;
        negedge_detected <= (signal_d == 1'b1 && signal_in == 1'b0);
    end

endmodule
