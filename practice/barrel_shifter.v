module barrel_shifter(A, S, Y);
input [3:0] A;
input [1:0] S;
wire [3:0] w;
output [3:0] Y;

mux2 m1(w[3], S[1], {A[3], A[1]});
mux2 m2(w[2], S[1], {A[2], A[0]});
mux2 m3(w[1], S[1], {A[1], A[3]});
mux2 m4(w[0], S[1], {A[0], A[2]});

mux2 m5(Y[3], S[0], {w[3], w[2]});
mux2 m6(Y[2], S[0], {w[2], w[1]});
mux2 m7(Y[1], S[0], {w[1], w[0]});
mux2 m8(Y[0], S[0], {w[0], w[3]});

endmodule

module mux2(Y, S, A);
input [0:1] A;
input S;
output Y;

assign Y = (S) ? A[1] : A[0] ;

endmodule

module tb;
reg [3:0] tb_A;
reg [1:0] tb_S;
wire [3:0] tb_Y;
// reg [0:1] test;

barrel_shifter b1(tb_A, tb_S, tb_Y);

initial begin
    $monitor("A = %b, S[1]=%b S[0]=%b and Y = %b\n", tb_A, tb_S[1], tb_S[0], tb_Y);
    // $monitor("A[3]=%b | A[2]=%b | A[1]=%b | A[0]=%b", tb_A[3], tb_A[2], tb_A[1], tb_A[0]);
    // $monitor("test=%b | test[1]=%b | test[0]=%b\n", test, test[1], test[0]);
    tb_A = 4'b1011;
    tb_S = 2'b0;
    // test = {1'b1,1'b0};
    
    #10 tb_S = 2'b00; //S[0]=0 S[1]=0
    #10 tb_S = 2'b01; //S[1]=0 S[0]=1
    #10 tb_S = 2'b10;
    #10 tb_S = 2'b11;
end

endmodule