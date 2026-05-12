module priority_encoder(
    input [3:0] i,
    output reg [1:0] Y
);

always @(*) begin
    casex (i)
        4'b0001: Y=2'b00;
        4'b001x: Y=2'b01;
        4'b01xx: Y=2'b10;
        4'b1xxx: Y=2'b11; 
        default: Y=2'bx;
    endcase
end

endmodule


module tb_priority_encoder;
reg [3:0] tb_i;
wire [1:0] tb_y;

priority_encoder penc(tb_i, tb_y);

initial begin
    tb_i=4'b0001;
    #10 tb_i=4'b0011;
    #10 tb_i=4'b1101;
    #10 tb_i=4'b0100;
    #10 tb_i=4'b0111;
end
initial begin
    
    $dumpfile("priority_encoder.vcd");
    $dumpvars;

    #80 $finish;
end

endmodule