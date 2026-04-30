`timescale 1ns/1ps
module ex1_ns;
  reg A;
  initial begin
    #10 A = 1;
  end
endmodule


`timescale 1us/1ns
module ex1_us;
  reg A;
  initial begin
    #10 A = 1;
  end
endmodule