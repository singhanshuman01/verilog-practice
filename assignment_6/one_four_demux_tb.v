`timescale 1ns/1ps
module one_four_demux_tb;
reg i;
reg [1:0] s;
wire [3:0]o;
integer k,q;
onefourdemux f1(o,i,s);

initial begin
    $monitor("input = %0b | output = %0b | select = %0b",i,o,s);
	for(k=1'b0;k<16;k=k+1) begin
			i = k; #10;
            for(q=1'b0;q<4;q=q+1) begin
                s = q; #5;
            end
			end 
     $finish; #500;
	end
   
	initial begin
		$dumpfile("onefour.vcd");
		$dumpvars;
	end

endmodule 