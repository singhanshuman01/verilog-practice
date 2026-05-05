`timescale 1ns/1ps
module prencoder_tb;
reg [7:0]i;
wire [3:0]o;
integer k;
pree p1(i,o);

initial begin
	for(k=1'b0;k<256;k=k+1) begin
			i = k; #10;
			$monitor("input = %0b | output = %0b",i,o);
			end
	end
	initial begin
		$dumpfile("prencoder.vcd");
		$dumpvars;
	end
endmodule 