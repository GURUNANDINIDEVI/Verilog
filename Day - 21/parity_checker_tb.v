//T.Guru Nandini Devi
//Nandinidevitekumudi@gmail.com
module tb_parity_checker;
    reg [3:0] data_in;
    reg parity_bit;
    wire error_flag;
    // Instantiate the DUT
    parity_checker u1(
        .data_in(data_in),
        .parity_bit(parity_bit),
        .error_flag(error_flag)
    );
    // Waveform dump
    initial begin
        $dumpfile("parity_checker.vcd");
        $dumpvars(0, tb_parity_checker);
    end
    // Stimulus
    initial begin
        $display("Time\tdata_in\tparity_bit\terror_flag");
        $monitor("%0dns\t%b\t%b\t\t%b", $time, data_in, parity_bit, error_flag);
        // Correct parity examples
        data_in = 4'b0000; parity_bit = 0; #10;
        data_in = 4'b0001; parity_bit = 1; #10;
        data_in = 4'b0011; parity_bit = 0; #10;
        data_in = 4'b0111; parity_bit = 1; #10;
        // Introduce errors (wrong parity bit)
        data_in = 4'b0001; parity_bit = 0; #10; // Should be 1 → Error
        data_in = 4'b0111; parity_bit = 0; #10; // Should be 1 → Error
        $finish;
    end
endmodule
