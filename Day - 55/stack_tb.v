//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
`timescale 1ns/1ps

module tb_stack;

    parameter WIDTH = 8;
    parameter DEPTH = 8;
    parameter ADDR_WIDTH = 3;

    reg clk, reset, push, pop;
    reg [WIDTH-1:0] data_in;
    wire [WIDTH-1:0] data_out;
    wire full, empty;

    // Instantiate the stack
    stack #(WIDTH, DEPTH, ADDR_WIDTH) dut (.clk(clk),.reset(reset),.push(push),.pop(pop),.data_in(data_in),.data_out(data_out),.full(full),.empty(empty));

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        push = 0;
        pop = 0;
        data_in = 0;

        #10 reset = 0;

        // PUSH 3 values
        #10 push = 1; data_in = 8'd10;
        #10 data_in = 8'd20;
        #10 data_in = 8'd30;
        #10 push = 0;

        // POP 2 values
        #10 pop = 1;
        #10 pop = 0;

        // PUSH 1 more
        #10 push = 1; data_in = 8'd40;
        #10 push = 0;

        // POP all remaining
        #10 pop = 1;
        #10;
        #10;
        pop = 0;

        #20 $finish;
    end

    initial begin
        $monitor("T=%0t | PUSH=%b POP=%b IN=%d OUT=%d SP_FULL=%b SP_EMPTY=%b",
                  $time, push, pop, data_in, data_out, full, empty);
    end

endmodule
