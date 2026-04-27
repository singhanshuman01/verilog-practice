
module switch_nand(output Y,input A,B);
supply0 GND;
supply1 VDD;
wire a;
pmos p1(Y,VDD,A);
pmos p2(Y,VDD,B);
nmos n1(a,GND,A);
nmos n2(Y,a,B);
endmodule 
