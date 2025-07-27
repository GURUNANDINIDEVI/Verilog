//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module t_ff (
    input clk, T,
    output reg Q
);
    always @(posedge clk) begin
        if (T)
            Q <= ~Q;
        else
            Q <= Q;
    end
endmodule

module sr_using_t (
    input clk, S, R,
    output Q
);
    wire T;

    assign T = (~S & ~R) ? 0 : // Hold
               ( S & ~Q) ? 1 : // Set
               ( R &  Q) ? 1 : // Reset
               0;              // Else Hold / Invalid treated as hold

    t_ff t1 (.clk(clk), .T(T), .Q(Q));
endmodule
