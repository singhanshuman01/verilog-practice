`timescale 1ns/1ps
module switch_fulladder_tb;
wire Y,Cout;
reg A,B,Cin;
switch_fulladder x1(Y,Cout,A,B,Cin);
initial begin 
    $monitor("A = %0b | B = %0b | Cin = %0b | Sum = %0b | Carry =%0b",A,B,Cin,Y,Cout);
    A = 1'b0; B = 1'b0; Cin = 1'b0; #10;
    A = 1'b0; B = 1'b0; Cin = 1'b1; #10;
    A = 1'b0; B = 1'b1; Cin = 1'b0; #10;
    A = 1'b0; B = 1'b1; Cin = 1'b1; #10;
    A = 1'b1; B = 1'b0; Cin = 1'b0; #10;
    A = 1'b1; B = 1'b0; Cin = 1'b1; #10;
    A = 1'b1; B = 1'b1; Cin = 1'b0; #10;
    A = 1'b1; B = 1'b1; Cin = 1'b1; #10;
end
initial begin
    $dumpfile("Switchfulladd.vcd");
    $dumpvars;
#500 $finish; 
end
endmodule 