module LRshift(input [3:0] A, m , output [3:0] Y);

assign Y[3:0] = m ? {A[2:0],1'b0} : ({1'b0, A[3:1]});
 
endmodule