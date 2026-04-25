module apnadecoder24(output [3:0]y, input[1:0]i);
wire [1:0]inot;
wire [3:0]x;

nand n1(inot[0],i[0],i[0]),
	  n2(inot[1],i[1],i[1]);

nand a1(x[0],inot[0],inot[1]),
	  a2(x[1],inot[0],i[1]),
	  a3(x[2],i[0],inot[1]),
	  a4(x[3],i[0],i[1]);
	  
nand b1(y[0],x[0],x[0]),
	  b2(y[1],x[1],x[1]),
	  b3(y[2],x[2],x[2]),
	  b4(y[3],x[3],x[3]);
	 
endmodule 