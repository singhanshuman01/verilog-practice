module HA(output wire Sum,Carry,input wire A,B);
xor x1(Sum,A,B);
and a1(Carry,A,B);
endmodule