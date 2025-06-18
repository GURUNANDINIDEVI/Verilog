// T.Guru Nandini Devi
// nandinidevitekumudi@gmail.com
module async_counter (
    input clk,     // Main clock
    input rst,     // Asynchronous reset
    output reg [3:0] q // 4-bit counter output
);

always @(posedge clk or posedge rst) begin
    if (rst)
        q[0] <= 0;
    else
        q[0] <= ~q[0]; // Toggle first bit
end
always @(posedge q[0] or posedge rst) begin
    if (rst)
        q[1] <= 0;
    else
        q[1] <= ~q[1]; // Toggle on q[0]
end
always @(posedge q[1] or posedge rst) begin
    if (rst)
        q[2] <= 0;
    else
        q[2] <= ~q[2]; // Toggle on q[1]
end
always @(posedge q[2] or posedge rst) begin
    if (rst)
        q[3] <= 0;
    else
        q[3] <= ~q[3]; // Toggle on q[2]
end
endmodule
