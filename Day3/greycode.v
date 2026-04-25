module greycode(output [7:0] Y, input [7:0] A);
assign Y [7] = A [7];
assign Y [6] = A[7] ^ A[6];
assign Y [5] = A[6] ^ A[5];
assign Y [4] = A[5] ^ A[4];
assign Y [3] = A[4] ^ A[3];
assign Y [2] = A[3] ^ A[2];
assign Y [1] = A[2] ^ A[1];
assign Y [0] = A[1] ^ A[0];

endmodule