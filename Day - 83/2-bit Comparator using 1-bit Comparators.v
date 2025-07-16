//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module comparator_1bit (
    input a, b,
    output gt, eq, lt
);
    assign gt = a & ~b;
    assign lt = ~a & b;
    assign eq = ~(gt | lt);
endmodule

module comparator_2bit (
    input [1:0] a, b,
    output a_gt_b, a_eq_b, a_lt_b
);
    wire gt1, eq1, lt1;
    wire gt0, eq0, lt0;

    // Compare MSB
    comparator_1bit cmp1 (
        .a(a[1]), .b(b[1]),
        .gt(gt1), .eq(eq1), .lt(lt1)
    );

    // Compare LSB
    comparator_1bit cmp0 (
        .a(a[0]), .b(b[0]),
        .gt(gt0), .eq(eq0), .lt(lt0)
    );

    assign a_gt_b = gt1 | (eq1 & gt0);
    assign a_lt_b = lt1 | (eq1 & lt0);
    assign a_eq_b = eq1 & eq0;
endmodule
