`timescale 1ns/1ps
module updowncount (
    input clk, rst,m, output [3:0] count
);
reg [3:0] c;
initial begin
    c <= 4'b0;
end
always @(posedge clk) begin
    if(rst) c=4'b0;
    else if(m==1) c<=c+1;
    else if(m==0) c<=c-1;
    
end
assign count = c;

endmodule

module tb;
reg clock,rst,mo;
wire [3:0] cnt;

// assign clock=0;
initial begin 
clock <= 1'b0;
rst <= 0;
mo <= 0;
end
always #5 clock <= ~clock;
updowncount c1 (clock, rst, mo,cnt);
initial begin
    $monitor("Time = %0t | rst=%b COUNT=%d | Mode =%b", $time, rst, cnt,mo);
    #50 mo <= 1;
    #10 mo <= 0;
    #110 rst <= 1;
    #7 rst <= 0;
end
initial begin
    
    $dumpfile("updown.vcd");
    $dumpvars;
    #250 $finish;
end

endmodule