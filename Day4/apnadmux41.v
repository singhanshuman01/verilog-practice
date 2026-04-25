module apnadmux41(output [3:0]y, input [1:0]s, input i);
wire [1:0]snot;
not n1(snot[0],s[0]),
    n2(snot[1],s[1]);
and a1(y[0],snot[0],snot[1],i),
    a2(y[1],s[1],snot[0],i),
    a3(y[2],s[0],snot[1],i),
    a4(y[3],s[0],s[1],i);
              
endmodule 