module BCD_add(output [3:0] S,input [3:0] A,B,output Carryout);
wire Cin = 1'b0, x;
wire [3:0] Z,Sum;
wire Cout,t1,t2,c,Co,u, Carry;
rcagate r1(Z[3:0], A[3:0],B[3:0], Carry,Cin);
myand m0(t1,Z[3],Z[2]);
myand m1(t2,Z[3],Z[1]);
myor m2(u,Carry,t1);
myor m3(Cout,u,t2);
rcagate r2(S[3:0], Z[3:0],{1'b0, Cout,Cout, 1'b0}, x,Cin);
assign Carryout = Carry?1:x?1:0;

endmodule 
