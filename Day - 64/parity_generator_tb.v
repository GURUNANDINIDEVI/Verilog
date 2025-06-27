//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_parity_generator;

    parameter WIDTH = 8;

    reg [WIDTH-1:0] data_in;
    wire even_parity, odd_parity;

    // Instantiate the parity generator
    parity_generator #(WIDTH) dut (
        .data_in(data_in),
        .even_parity(even_parity),
        .odd_parity(odd_parity)
    );

    initial begin
        $display("Data Input    -> Even Parity | Odd Parity");

        data_in = 8'b00000000; #5;
        $display("%b -> %b           | %b", data_in, even_parity, odd_parity);

        data_in = 8'b00000001; #5;
        $display("%b -> %b           | %b", data_in, even_parity, odd_parity);

        data_in = 8'b10101010; #5;
        $display("%b -> %b           | %b", data_in, even_parity, odd_parity);

        data_in = 8'b11110000; #5;
        $display("%b -> %b           | %b", data_in, even_parity, odd_parity);

        data_in = 8'b11111111; #5;
        $display("%b -> %b           | %b", data_in, even_parity, odd_parity);

        #10 $finish;
    end

endmodule
