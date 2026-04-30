`timescale 1ns/1ps
module A;
  reg Y;
  initial #5 Y = 1;
endmodule

`timescale 1us/1ns
module B;
  reg Y;
  initial #5 Y = 1;
endmodule