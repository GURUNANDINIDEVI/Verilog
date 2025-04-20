//T.Guru Nandini Devi
//nandinidevitekumudi@gamil.com
module tb_binary_multiplier_2bit;

    reg [1:0] A, B;
    wire [3:0] Product;

    binary_multiplier_2bit u1(
        .A(A),
        .B(B),
        .Product(Product)
    );

    initial begin
        $dumpfile("multiplier_2bit.vcd");
        $dumpvars(0, tb_binary_multiplier_2bit);

        $display("Time\tA\tB\tProduct");
        $monitor("%0t\t%b\t%b\t%b", $time, A, B, Product);

        A = 2'b00; B = 2'b00; #10;
        A = 2'b01; B = 2'b10; #10;
        A = 2'b10; B = 2'b10; #10;
        A = 2'b11; B = 2'b01; #10;
        A = 2'b11; B = 2'b11; #10;

        $finish;
    end
endmodule
