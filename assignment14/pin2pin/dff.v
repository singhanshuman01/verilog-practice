module dff (q, d, clk, rst);
  input d, clk, rst;
  output q;

  specify
    (negedge clk => (q : d)) = (2,3);
    (posedge rst => (q : 1'b0)) = (1,1);
  endspecify
endmodule