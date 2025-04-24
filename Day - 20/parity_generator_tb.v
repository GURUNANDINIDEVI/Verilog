//T.Guru Nandini Devi
//Nandinidevitekumudi@gmail.com
module tb_parity_generator;

    reg [3:0] data_in;
    wire parity_bit;

    // Instantiate the DUT
    parity_generator u1(
        .data_in(data_in),
        .parity_bit(parity_bit)
    );

    initial begin
        $display("Time\tdata_in\tparity_bit");
        $monitor("%0dns\t%b\t%b", $time, data_in, parity_bit);

        data_in = 4'b0000; #10;
        data_in = 4'b0001; #10;
        data_in = 4'b0011; #10;
        data_in = 4'b0111; #10;
        data_in = 4'b1111; #10;
        data_in = 4'b1010; #10;

        $finish;
    end

endmodule
