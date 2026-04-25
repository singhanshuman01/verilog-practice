module bufmux21(output y,input [1:0]i,input s);
wire t;
not n(t,s);
bufif0 b1(y,i[0],s),
       b2(y,i[1],t);
endmodule 