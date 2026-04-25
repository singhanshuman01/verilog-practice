module apnamux(input [3:0] I, output Y, input [1:0] S);

wire [7:0] w;
wire t1,t2;

nand n1(t1, S[0], S[0]),
	  n2(t2, S[1], S[1]);
nand nan0(w[0], I[0], t1),
	  nan1(w[1], I[1], S[0]),
	  nan2(w[2], I[2], t1),
	  nan3(w[3], I[3], S[0]),
	  nan4(w[4], w[0], w[1]),
	  nan5(w[5], w[2], w[3]),
	  nan6(w[6], t2, w[4]),
	  nan7(w[7], S[1], w[5]),
	  nan8(Y, w[6],w[7]);

endmodule