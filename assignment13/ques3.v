`timescale 1ns/1ns
module ex3_1;
  reg A;
  initial #2.6 A = 1;
endmodule

`timescale 1ns/1ps
module ex3_2;
  reg A;
  initial #2.6 A = 1;
endmodule