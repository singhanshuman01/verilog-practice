module switch_fulladder(output Sum,Cout,input A,B,Cin);
supply0 GND;
supply1 VDD;
wire a,b,c,d,Y1,Abar,Bbar;
pmos p1(a,VDD,A);
pmos p2(a,VDD,B);
pmos p3(b,a,A);
pmos p4(c,b,B);
pmos p5(c,a,Cin);
nmos n1(d,GND,A);
nmos n2(d,GND,B);
nmos n3(c,d,Cin);
nmos n4(e,GND,B);
nmos n5(c,e,A);
nmos n6(Cout,GND,c);
pmos p6(Cout,VDD,c);
pmos p7(f,VDD,A);
pmos p8(f,VDD,B);
pmos p9(f,VDD,Cin);
pmos p10(s,f,c);
pmos p11(h,f,A);
pmos p12(i,h,B);
pmos p13(s,i,Cin);
nmos n7(g,GND,A);
nmos n8(g,GND,B);
nmos n9(g,GND,Cin);
nmos n10(s,g,c);
nmos n11(j,GND,Cin);
nmos n12(k,j,B);
nmos n13(s,k,A);

nmos n14(Sum,GND,s);
pmos p14(Sum,VDD,s);

endmodule 