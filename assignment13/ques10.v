`timescale 1ns/1ps
module ex10;
  initial begin
    $display("Time = %0t", $time);
    #10;
    $display("Time = %0t", $time);
    #5;
    $display("Time = %0t", $time);
  end
endmodule