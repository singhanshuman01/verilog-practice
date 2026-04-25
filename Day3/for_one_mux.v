module for_one_mux(Y, A, S);
input [7:0] A;
input [2:0] S;
output Y;

assign Y = S[0]? ( S[1]? ( S[2]? A[7]:A[6] ) : ( S[2]?A[5]:A[4] ) ) : (S[1]? ( S[2]? A[3]:A[2] ) : ( S[2]?A[1]:A[0] )) ;
endmodule