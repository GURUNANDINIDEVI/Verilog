//T.Guru Nandini devi
//nandinidevitekumudi@gmail.com
module parity_generator #(
    parameter WIDTH = 8
)(
    input  [WIDTH-1:0] data_in,
    output reg even_parity,
    output reg odd_parity
);

    integer i;
    reg [3:0] one_count;

    always @(*) begin
        one_count = 0;
        for (i = 0; i < WIDTH; i = i + 1) begin
            if (data_in[i])
                one_count = one_count + 1;
        end

        even_parity = ~one_count[0];  // Even if count of 1s is even
        odd_parity  =  one_count[0];  // Odd if count of 1s is odd
    end

endmodule
