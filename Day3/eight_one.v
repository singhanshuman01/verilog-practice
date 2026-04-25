module eight_one(output wire Y, input wire [7:0]A,input [2:0] S);
wire [5:0] i;
two_onemux a(i[0],A[0],A[1],S[2]);
two_onemux a2(i[1],A[2],A[3],S[2]);
two_onemux a3(i[2],A[4],A[5],S[2]);
two_onemux a4(i[3],A[6],A[7],S[2]);
two_onemux a5(i[4],i[0],i[1],S[1]);
two_onemux a6(i[5],i[2],i[3],S[1]);
two_onemux a7(Y,i[4],i[5],S[0]);
endmodule 