module FA(input A, B, Cin, output S, Cout);

wire t1,t2, t3;

xor x1(t1,A,B),
	x2(S, t1, Cin);

and a1(t2, A, B),
	a2(t3, t1, Cin);

or o1(Cout, t2, t3);

endmodule