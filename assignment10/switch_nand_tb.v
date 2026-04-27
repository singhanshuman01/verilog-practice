`timescale 1ns/1ps
module switch_nand_tb;
wire Y;
reg A,B;
switch_xnor x1(Y,A,B);
initial begin 
    $monitor("A = %0b | B = %0b | Y = %0b",A,B,Y);
    A = 1'b0; #10;
    B = 1'b0; #5;
    B = 1'b1; #5;
    A = 1'b1; #10;
    B = 1'b0; #5;
    B = 1'b1; #5;
end
initial begin
#500 $finish; 
end
endmodule 