module four_one_mux(output wire Y, input wire [3:0]A,input [1:0] S);
wire int1,int2;
two_onemux a(int1,A[0],A[1],S[1]);
two_onemux a2(int2,A[2],A[3],S[1]);
two_onemux a3(Y,int1,int2,S[0]);
endmodule
