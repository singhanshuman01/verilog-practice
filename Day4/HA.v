module HA(input A, B, output S,C);

xor x1(S,A,B);
and a1(C,A,B);

endmodule