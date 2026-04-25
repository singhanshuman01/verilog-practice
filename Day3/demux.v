module demux(input X,input S,output Y0,Y1);
	assign Y0 = X &(~S);
	assign Y1 = X & S;
endmodule 
