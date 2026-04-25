module and_gate(input A, B, output Y);

assign Y = A&B;
endmodule

module tb_and_gate;

reg A,B;
wire Y;

and_gate DUT(A,B,Y);
initial begin

 $monitor("Time = %0d, A = %0d, B = %0d, Y = %0d.\n",A, B, Y);
 A = 1'b0; B = 1'b0;
 #5
 A = 1'b0; B = 1'B1;
 #5 
 A = 1'b1; B = 1'b0;
 #5
 A = 1'b1; B = 1'b1; 
 end
 
 endmodule