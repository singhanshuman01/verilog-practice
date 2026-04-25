module alu_2_bit (
    A,B,S,Y
);
input A, B;
input  [1:0] S;
output Y;

assign Y = S[1]?S[0]?A|B
                    :A&B
               :S[0]?A-B
                    :A+B;

endmodule


module tb_alu;
reg A_tb, B_tb;
reg [1:0] S_tb;
wire Y;

alu_2_bit a1(.A(A_tb), .B(B_tb), .S(S_tb), .Y(Y));
// alu_2_bit a2(.A(A_tb), .B(B_tb), .S(S_tb), .Y(Y));

initial begin
    A_tb =1; B_tb =1;
    $monitor($time, " A=%b, B=%b\n", A_tb, B_tb);
    S_tb[0] = 0; S_tb = 0;
    #5 S_tb[0] = 1; S_tb[1] = 0;
    #5 S_tb[0] = 0; S_tb[1] = 1;
    #5 S_tb[0] = 1; S_tb[1] = 1;
    #10 $finish;
end

initial begin
    $dumpfile("alu_2_bit.vcd");
    $dumpvars;
end
    
endmodule