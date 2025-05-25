//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module seq_detector (
    input clk,
    input rst,
    input din,
    output reg dout
);
// State encoding
parameter S0 = 3'b000,
          S1 = 3'b001,
          S2 = 3'b010,
          S3 = 3'b011,
          S4 = 3'b100;

reg [2:0] current_state, next_state;
// State register
always @(posedge clk or posedge rst) begin
    if (rst)
        current_state <= S0;
    else
        current_state <= next_state;
end
// Next state and output logic (Mealy)
always @(*) begin
    next_state = current_state;
    dout = 1'b0;

    case (current_state)
        S0: begin
            if (din) next_state = S1;
        end
        S1: begin
            if (!din) next_state = S2;
            else next_state = S1;
        end
        S2: begin
            if (din) next_state = S3;
            else next_state = S0;
        end
        S3: begin
            if (din) begin
                next_state = S1;
                dout = 1'b1;  // Sequence detected
            end
            else next_state = S2;
        end
        default: next_state = S0;
    endcase
end
endmodule

