`timescale 1ns/1ps
module addcumsub_tb;
reg [3:0] X,Y;
reg Ca;
wire [3:0]O;
wire Carry;
integer i,j;
addcumsub s(O,Carry,X,Y,Ca);
always #10 Ca = 1'b0;
always #10 Ca = 1'b1;

initial begin
	for(i=4'b0;i<16;i=i+1) begin
			X = i; #5;
		for(j=4'b0;j<16;j=j+1) begin
			Y = j; #10;
	
	$monitor("Time = %0d | A = %0d | B = %0d | Y = %0d | Cout = %0d | Ca = %0d",$time,X,Y,O,Carry,Ca);
	end
	end
	#50 $finish; 
end
initial begin
$dumpfile("addcumsub.vcd");
$dumpvars;
end
endmodule	