
`timescale 1us/1ns
module sub;
  reg A;
  initial #1 A = 1;  // 1 us
endmodule

`timescale 1ns/1ps
module top;
  sub s();
  reg B;
  initial #1 B = 1;  // 1 ns
endmodule