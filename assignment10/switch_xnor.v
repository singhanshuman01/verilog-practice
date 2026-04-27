module switch_xnor(output Y,input A,B);
supply0 GND;
supply1 VDD;
wire a,b,c,d,Y1,Abar,Bbar;
pmos p3(Abar,VDD,A);
pmos p4(Bbar,VDD,B);
nmos n5(Abar,GND,A);
nmos n6(Bbar,GND,B);
pmos p1(a,VDD,A);
pmos p2(Y1,a,Bbar);
pmos p5(b,VDD,Abar);
pmos p6(Y1,b,B);
nmos n1(Y1,c,A);
nmos n2(c,GND,B);
nmos n3(Y1,d,Abar);
nmos n4(d,GND,Bbar);
pmos p7(Y,VDD,Y1);
nmos n7(Y,GND,Y1);
endmodule 