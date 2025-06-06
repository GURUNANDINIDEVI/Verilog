//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_mux4to1;
    reg [1:0] sel;
    reg [3:0] d;
    wire y;
    // Instantiate the multiplexer
    mux4to1 u1 (
        .sel(sel),
        .d(d),
        .y(y)
    );

    initial begin
        // Apply test cases
        d = 4'b1010; // Sample data inputs
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        // Finish simulation
        $finish;
    end

    initial begin
        $monitor("Time = %0t | sel = %b | d = %b | y = %b", $time, sel, d, y);
    end
endmodule
