module nand_p2p(output out, input a, b);
  nand #(1:2:3, 3:2:1) g1 (out, a, b);
endmodule