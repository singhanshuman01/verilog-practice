`timescale 1ns/1ps
module mod10counter (
    input clk, rst, output [3:0] count
);
reg [3:0] c;
initial begin
    c = 4'b0;
end
always @(posedge clk) begin
    if(rst) c=4'b0;
    else c=c+1;
    if(c>9) c= 0;
end
assign count = c;

endmodule

module tb;
reg clock,rst;
wire [3:0] cnt;

// assign clock=0;
initial begin 
clock = 1'b0;
rst = 0;
end
always #5 clock <= ~clock;
mod10counter c1 (clock, rst, cnt);
initial begin
    $monitor("Time = %0t | rst=%b COUNT=%d", $time, rst, cnt);
    #110 rst = 1;
    #7 rst = 0;
end
initial begin
    
    $dumpfile("mod10counter.vcd");
    $dumpvars;
    #150 $finish;
end

endmodule