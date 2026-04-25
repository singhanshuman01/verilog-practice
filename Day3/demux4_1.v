module demux4_1 (input X,input [1:0]S,output [3:0]Y);
	assign Y[0]= X*~^S0*^~S1
	assign Y[1]= X*^~S0*S1
	assign Y[2]= X*S0*~^S1
	assign Y[3]= X*S0*S1
endmodule 