`timescale 1ns/1ps
module and_tb;
reg X,Y;
wire O;
and_gate a1(.Y(O),.A(X),.B(Y));

initial begin
	$monitor("Time = %0d | A = %0d | B = %0d | Y = %0d",$time,X,Y,O);
	X = 1'b0 ; Y = 1'b0;
	#10 X = 1'b0 ; Y = 1'b1;
	#10 X = 1'b1 ; Y = 1'b0;
	#10 X = 1'b1 ; Y = 1'b1;
	#40 $finish;
end
initial begin
$dumpfile("File1.vcd");
$dumpvars;
end
endmodule	