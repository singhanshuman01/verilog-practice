module CSA(output [4:0] Y,input [3:0] A,B,Cin, output Cout);
wire [3:0] int1,int2, carry;
assign int1 = A ^ B ^ Cin;
assign int2 = A&B | (A^B)&Cin;



assign carry[0] = (int2[0]&int1[1]);
assign carry[1] = (int2[1]&int1[2]) | ((int2[1]^int1[2])&(int2[0]&int1[1]));
assign carry[2] = (int2[2]&int1[3]) | ((int2[2]^int1[3])&((int2[1]&int1[2]) | ((int2[1]^int1[2])&(int2[0]&int1[1]))));
assign Cout = (int2[3]^1'b0)&((int2[2]&int1[3]) | ((int2[2]^int1[3])&((int2[1]&int1[2]) | ((int2[1]^int1[2])&(int2[0]&int1[1])))));

assign Y[0] = int1[0];
assign Y[1] = int2[0]^int1[1];
assign Y[2] = int2[1]^int1[2]^carry[0];
assign Y[3] = int2[2]^int1[3]^carry[1];
assign Y[4] = int2[3]^1'b0^carry[2];

endmodule