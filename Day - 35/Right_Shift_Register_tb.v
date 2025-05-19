//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module right_shift_register_tb;
reg clk, rst, SI;
wire [3:0] Q;

// Instantiate the DUT
right_shift_register u1(.clk(clk),.rst(rst),.SI(SI),.Q(Q));

// Clock generation: 10 ns period
always #5 clk = ~clk;

initial begin
    $display("Time\tclk rst SI | Q");
    $monitor("%0t\t%b   %b   %b  | %b", $time, clk, rst, SI, Q);
    // Initial values
    clk = 0; rst = 1; SI = 0;
    #10;
    // Release reset
    rst = 0;
    // Shift in pattern: 1, 0, 1, 1
    SI = 1; #10;
    SI = 0; #10;
    SI = 1; #10;
    SI = 1; #10;
    $finish;
end

endmodule
