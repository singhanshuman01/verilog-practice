module mux41(output y, input [3:0] I, input [2:0] s);

wire [4:0] w;
and a1(w[0], I[0], ~s[0], ~s[1]);
and a2(w[1], I[1], s[0], ~s[1]);
and a3(w[2], I[2], s[0], s[1]);
and a4(w[3], I[3], s[0], s[1]);
or o1(w[4], I[0], I[2], I[1]);
or o2(y, w[4], I[3]);

endmodule
