module and_p2p(output out, input a, b);
  and #(2,3) g1 (out, a, b); // rise=2, fall=3
endmodule