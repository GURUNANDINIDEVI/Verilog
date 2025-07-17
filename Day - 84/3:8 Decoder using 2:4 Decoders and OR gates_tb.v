//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tb_comparator_2bit;
    reg [1:0] a, b;
    wire gt, eq, lt;

    comparator_2bit uut (
        .a(a), .b(b),
        .a_gt_b(gt), .a_eq_b(eq), .a_lt_b(lt)
    );

    initial begin
        $display("A  B  | GT EQ LT");
        for (integer i = 0; i < 4; i = i + 1) begin
            for (integer j = 0; j < 4; j = j + 1) begin
                a = i[1:0]; b = j[1:0]; #5;
                $display("%b %b |  %b  %b  %b", a, b, gt, eq, lt);
            end
        end
        $finish;
    end
endmodule
