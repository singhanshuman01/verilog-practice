`timescale 1ns/1ps
module greycode_tb;
reg [7:0] X;
wire [7:0] Y;
integer i;
greycode g1(Y,X);
initial begin
    	for(i=8'b0;i<256;i=i+1) begin
			X = i; #5;
	
	  $monitor("X = %b | Y = %b",X,Y);
	end
    #50 $finish; 
	end
initial begin
    $dumpfile("greycode.vcd");
    $dumpvars;
end
endmodule