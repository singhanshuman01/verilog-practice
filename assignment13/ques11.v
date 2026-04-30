`timescale 1ns/1ps
module clk1_gen;
  reg clk1 = 0;
  always #5 clk1 = ~clk1;  // 100 MHz
endmodule

`timescale 1us/1ns
module clk2_gen;
  reg clk2 = 0;
  always #5 clk2 = ~clk2;  // 100 kHz
endmodule

module tb;
initial begin
    $dumpfile("ques11.vcd");
    $dumpvars;
    #1000 $finish;
end
endmodule