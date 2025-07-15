//T.Guru Nandini Devi
//nandinitekumudi@gmail.com
module full_adder (
    input a, b, cin,
    output sum, cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
module ripple_carry_adder (
    input  [3:0] a, b,
    input        cin,
    output [3:0] sum,
    output       cout
);
    wire c1, c2, c3;

    full_adder fa0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c1));
    full_adder fa1 (.a(a[1]), .b(b[1]), .cin(c1),  .sum(sum[1]), .cout(c2));
    full_adder fa2 (.a(a[2]), .b(b[2]), .cin(c2),  .sum(sum[2]), .cout(c3));
    full_adder fa3 (.a(a[3]), .b(b[3]), .cin(c3),  .sum(sum[3]), .cout(cout));
endmodule
module subtractor_4bit (
    input  [3:0] a, b,
    output [3:0] diff,
    output       borrow_out
);
    wire [3:0] b_comp;
    wire       cout;

    assign b_comp = ~b;  // 1's complement of B

    ripple_carry_adder adder (
        .a(a),
        .b(b_comp),
        .cin(1'b1),       // Adding +1 to make it 2's complement
        .sum(diff),
        .cout(borrow_out) // Interpreted as borrow here
    );
endmodule

