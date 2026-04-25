module demux1_4 (
    output [3:0] y,
    input a,
    input [1:0] s
);
assign y[0] = a & (~s[0]) & (~s[1]),
       y[1] = a & (s[0]) & (~s[1]),
       y[2] = a & (~s[0]) & (s[1]),
       y[3] = a & (s[0]) & (s[1]);

endmodule