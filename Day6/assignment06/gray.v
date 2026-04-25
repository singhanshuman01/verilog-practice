module gray(A,Y);
input [3:0] A;
output [3:0] Y;

assign Y[3] = A[3];
assign Y[2] = A[3]^A[2];
assign Y[1] = A[2]^A[1];
assign Y[0] = A[1]^A[0];

endmodule

module tb_gray();
reg [3:0] A_tb;
wire [3:0] Y_tb;
integer i;
gray uu1(.A(A_tb), .Y(Y_tb));

initial begin
    A_tb = 4'b0000;
    for ( i=1 ;i<16 ;i=i+1 ) begin
        $monitor($time, " A = %b\n", A_tb);
        #5 A_tb = A_tb+1'b1;
    end
    #10 $finish;
end

initial begin
    $dumpfile("gray.vcd");
    $dumpvars;
end

endmodule