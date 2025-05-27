//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module mealy_seq_detector (
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

reg [2:0] current_state, next_state;

// State Register
always @(posedge clk or posedge rst) begin
    if (rst)
        current_state <= S0;
    else
        current_state <= next_state;
end

// Next State Logic & Output Logic
always @(*) begin
    // Default assignments
    next_state = current_state;
    dout = 0;

    case (current_state)
        S0: begin
            if (din)
                next_state = S1;
        end

        S1: begin
            if (din)
                next_state = S1;
            else
                next_state = S2;
        end

        S2: begin
            if (din)
                next_state = S3;
            else
                next_state = S0;
        end

        S3: begin
            if (din) begin
                next_state = S1;
                dout = 1; // Output happens here (Mealy)
            end else
                next_state = S2;
        end

        default: next_state = S0;
    endcase
end

endmodule
