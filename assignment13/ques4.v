`timescale 1ns/1ps

module ques4;
reg clk;
initial clk = 0;
always #5 clk = ~clk;
endmodule