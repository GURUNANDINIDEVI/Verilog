//T. Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module reverse_array #(
    parameter N = 5,
    parameter WIDTH = 8
)(
    input  wire [N*WIDTH-1:0] in_array_flat,
    output reg  [N*WIDTH-1:0] out_array_flat
);

    integer i;

    always @(*) begin
        for (i = 0; i < N; i = i + 1) begin
            out_array_flat[i*WIDTH +: WIDTH] = in_array_flat[(N-1-i)*WIDTH +: WIDTH];
        end
    end

endmodule
