//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_digital_clock;
    reg clk = 0;
    reg rst = 1;
    wire [5:0] seconds, minutes;
    wire [4:0] hours;

    digital_clock uut (.clk(clk), .rst(rst), .seconds(seconds), .minutes(minutes), .hours(hours));

    always #1 clk = ~clk; // 1Hz Clock Simulation (toggle every 1 time unit)

    initial begin
        $dumpfile("digital_clock.vcd");
        $dumpvars(0, tb_digital_clock);
        #2 rst = 0;
        #500; // Run simulation for 500 time units
        $finish;
    end

    always @(posedge clk) begin
        $display("TIME -> %02d:%02d:%02d", hours, minutes, seconds);
    end
endmodule
