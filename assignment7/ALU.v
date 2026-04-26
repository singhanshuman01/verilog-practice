module ALU(
    input a,b,
    input [1:0] sel,
    output reg Y
);

always @(sel) begin
    
case (sel)
    0: Y=a^b;
    1: Y=a-b ;
    2: Y=a&b ;
    3: Y=a|b ;
    default: Y=1'bX;
endcase
end

endmodule

module tb_alu;
reg a, b;
reg [1:0] sel;
wire y;
ALU a1(a,b,sel,y);
initial begin
    sel=0;
    a=0;
    b=1;

    #20 a=1; sel = 2'b01;
    #20 a=0; sel = 2'b10;
    #20 a=1; sel = 2'b11;

    $dumpfile("alu.vcd");
    $dumpvars;
    #80 $finish;
end
    
endmodule