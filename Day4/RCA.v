module RCA(input [3:0] A, B, input Cin, output [3:0] S, output C);

wire [3:0] t1,t2, t3, Cout;

xor x1(t1[0],A[0],B[0]);
xor x2(S[0], t1[0], Cin);
and a1(t2[0], A[0], B[0]);
and a2(t3[0], t1[0], Cin);
or o1(Cout[0], t2[0], t3[0]);

xor x3(t1[1],A[1],B[1]);
xor x4(S[1], t1[1], Cout[0]);
and a3(t2[1], A[1], B[1]);
and a4(t3[1], t1[1], Cout[0]);
or o2(Cout[1], t2[1], t3[1]);

xor x5(t1[2],A[2],B[2]);
xor x6(S[2], t1[2], Cout[1]);
and a5(t2[2], A[2], B[2]);
and a6(t3[2], t1[2], Cout[1]);
or o3(Cout[2], t2[2], t3[2]);

xor x7(t1[3],A[3],B[3]);
xor x8(S[3], t1[3], Cout[2]);
and a7(t2[3], A[3], B[3]);
and a8(t3[3], t1[3], Cout[2]);
or o4(Cout[3], t2[3], t3[3]);

assign C = Cout[3];


endmodule