//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module moore_seq_detector (
    input clk,
    input rst,
    input din,
    output reg dout
);

// State encoding
parameter S0 = 3'b000;  // Initial state
parameter S1 = 3'b001;  // Detected 1
parameter S2 = 3'b010;  // Detected 10
parameter S3 = 3'b011;  // Detected 101
parameter S4 = 3'b100;  // Detected 1011 (output = 1)

reg [2:0] current_state, next_state;

// State register
always @(posedge clk or posedge rst) begin
    if (rst)
        current_state <= S0;
    else
        current_state <= next_state;
end

// Next state logic
always @(*) begin
    case (current_state)
        S0: begin
            if (din == 1)
                next_state = S1;
            else
                next_state = S0;
        end

        S1: begin
            if (din == 0)
                next_state = S2;
            else
                next_state = S1;
        end

        S2: begin
            if (din == 1)
                next_state = S3;
            else
                next_state = S0;
        end

        S3: begin
            if (din == 1)
                next_state = S4;
            else
                next_state = S2;
        end

        S4: begin
            if (din == 1)
                next_state = S1;
            else
                next_state = S2;
        end

        default: next_state = S0;
    endcase
end

// Output logic (Moore: depends only on state)
always @(*) begin
    case (current_state)
        S4: dout = 1;
        default: dout = 0;
    endcase
end

endmodule
