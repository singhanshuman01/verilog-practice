module inv_dd(output reg out, input in);
  always @(in)
    out = #2 ~in;
endmodule