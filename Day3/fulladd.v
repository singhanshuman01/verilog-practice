module fulladd(output Sum, Cout, input A,B,Cin);
wire i,c,c1;
halfadd(i,c,A,B);
myor1(Cout,c,c1);
halfadd(Sum,c1,i,Cin);
endmodule


module myor1(output Y2, input X2,Z2);
assign Y2 = X2 | Z2;
endmodule