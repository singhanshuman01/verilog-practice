`timescale 1ns/1ps
module multi_4bittb;
reg [3:0] X,Y;
wire [7:0] O;
integer i,j;
multiiiii m1(O,X,Y);

initial begin
	for(i=4'b0;i<16;i=i+1) begin
			X = i; #5;
		for(j=4'b0;j<16;j=j+1) begin
			Y = j; #10;
	
	$monitor("Time = %0d | A = %0d | B = %0d | Y = %0d",$time,X,Y,O);
	end
	end
	#50 $finish; 
end
initial begin
$dumpfile("multi4.vcd");
$dumpvars;
end
endmodule