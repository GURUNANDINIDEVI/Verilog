//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module priority_encoder_8to3 (
    input  [7:0] D,
    output reg [2:0] Y,
    output reg valid
);
    always @(*) begin
        valid = 1; // default valid
        if (D[7])      Y = 3'b111;
        else if (D[6]) Y = 3'b110;
        else if (D[5]) Y = 3'b101;
        else if (D[4]) Y = 3'b100;
        else if (D[3]) Y = 3'b011;
        else if (D[2]) Y = 3'b010;
        else if (D[1]) Y = 3'b001;
        else if (D[0]) Y = 3'b000;
        else begin
            Y = 3'b000;
            valid = 0;
        end
    end
endmodule
