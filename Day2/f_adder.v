`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2026 10:25:18
// Design Name: 
// Module Name: f_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module f_adder(sum,cout,a,b,c);

output [3:0] sum;
output cout;
input [3:0] a,b;
input c;

assign {cout,sum} = a+b+c;
//integer i;

//initial begin
//for (i=0; i<4 ;i+=1)begin   
//    assign sum[i:0] = a[i:0]+b[i:0]+c; 
//end 

endmodule
