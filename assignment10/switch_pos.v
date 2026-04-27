module switch_pos(output Z,input A,B,C,D,E);
supply0 GND;
supply1 VDD;
wire a,b,c,d,Y1,Abar,Bbar;
pmos p1(a,VDD,C);
pmos p2(Z,a,B);
pmos p5(b,VDD,D);
pmos p6(c,b,E);
pmos p7(Z,c,A);
nmos n1(d,GND,D);
nmos n3(d,GND,E);
nmos n4(d,GND,A);
nmos n5(Z,d,B);
nmos n6(Z,d,C);
endmodule 