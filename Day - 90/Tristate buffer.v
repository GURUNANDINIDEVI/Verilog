//T.Guru Nandini Devi
//nandinidevitekumudi@gmail.com
module tristate_buffer (
    input wire in,
    input wire enable,
    output wire out
);

assign out = (enable) ? in : 1'bz;

endmodule
