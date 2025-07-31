//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module digital_clock (
    input clk,        // Assume 1Hz clock
    input rst,        // Reset
    output reg [5:0] seconds,
    output reg [5:0] minutes,
    output reg [4:0] hours
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            seconds <= 0;
            minutes <= 0;
            hours <= 0;
        end else begin
            if (seconds < 59)
                seconds <= seconds + 1;
            else begin
                seconds <= 0;
                if (minutes < 59)
                    minutes <= minutes + 1;
                else begin
                    minutes <= 0;
                    if (hours < 23)
                        hours <= hours + 1;
                    else
                        hours <= 0;
                end
            end
        end
    end
endmodule
