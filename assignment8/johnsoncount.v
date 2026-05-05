`timescale 1ns/1ns
module johnsoncount(output [3:0] y,input clk,rst);
reg [3:0] c;
reg temp;
initial begin
    c = 4'b0000;
end
always @(posedge clk) begin
    if(rst) c=4'b0;
    else begin 
        temp = ~c[0];
        c = c>>1;
        c[3] = temp;
    end
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
always #2 clock <= ~clock;
johnsoncount c1 (x, clock, rst);
initial begin
    $monitor("Time = %0t | rst=%b COUNT=%b", $time, rst, x);
    #110 rst = 1;
    #7 rst = 0;
end
initial begin
    
    $dumpfile("johnsoncount.vcd");
    $dumpvars;
    #150 $finish;
end

endmodule