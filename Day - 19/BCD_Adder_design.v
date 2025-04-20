//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module BCD_Adder(
    input [7:0] A,    // 8-bit BCD number 1 (two digits)
    input [7:0] B,    // 8-bit BCD number 2 (two digits)
    output reg [7:0] SUM, // 8-bit sum
    output reg CO      // Carry Out
);
    
    wire [8:0] temp_sum; // Temporary sum (9 bits to accommodate carry)
    reg [8:0] corrected_sum;
    
    // Adding two BCD numbers
    assign temp_sum = A + B;
    
    always @(*) begin
        // If sum exceeds 9 (decimal), correction is needed
        if (temp_sum > 9) begin
            corrected_sum = temp_sum + 6; // Add 6 for correction to get valid BCD
            CO = 1; // Carry-out occurs if there's an overflow
        end else begin
            corrected_sum = temp_sum;
            CO = 0; // No carry-out
        end
        SUM = corrected_sum[7:0]; // Assign the 8-bit result
    end

endmodule
