`timescale 1ns/1ps
module srlatch(Q,Qbar,Sbar,Rbar);
output Q, Qbar;
input Sbar, Rbar;
nand n1(Q,Sbar,Qbar);
nand n2(Qbar,Rbar,Q);
endmodule
module srlatch_tb;
wire q,qbar;
reg  set,reset;
integer file,file2;
srlatch s1(q,qbar,~set,~reset);
initial begin
    file = $fopen("srlatch.txt","r");
    if (file == 0) begin
        $display("Error file not found\n");
        $finish;
    end
    while(!$feof(file)) begin
       file2=$fscanf(file,"%b %b\n",set,reset);
        #10;
        $display ("S = %b,R = %b,Q = %b, Qbar = %b",set,reset,q,qbar);
    end
    $fclose(file);
    $finish;

end
initial begin
    $dumpfile("srlatch.vcd");
    $dumpvars;

end
endmodule 




