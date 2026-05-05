`timescale 1ns/1ps
module four_one_mux_tb;
reg [3:0] i;
reg [1:0] s;
wire o;
integer k,q;
four_one_mux f2(o,i,s);

initial begin
    $monitor("input = %0b | output = %0b | select = %0b",i,o,s);
	for(k=1'b0;k<16;k=k+1) begin
			i = k; #10;
            for(q=1'b0;q<4;q=q+1) begin
                s = q; #10;
            end
			end
	end

	initial begin
		$dumpfile("fourone.vcd");
		$dumpvars;
	end
endmodule 