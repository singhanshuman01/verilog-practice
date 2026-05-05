`timescale 1ns/1ps
module ring_4bitcount(output [3:0] y,input clk,rst);
reg [3:0] c;
initial begin
    c = 4'b0001;
end
always @(posedge clk) begin
    if(rst) c=4'b0001;
    else c = c<<1;
    if(c==0) c= 0001;
end
assign y = c;
endmodule

module tb;
reg clock,rst;
wire [3:0] x;

// assign clock=0;
initial begin 
clock = 1'b0;
rst = 0;
end
always #5 clock <= ~clock;
ring_4bitcount c1 (x, clock, rst);
initial begin
    $monitor("Time = %0t | rst=%b COUNT=%b", $time, rst, x);
    #110 rst = 1;
    #7 rst = 0;
end
initial begin
    
    $dumpfile("ringcount.vcd");
    $dumpvars;
    #150 $finish;
end

endmodule