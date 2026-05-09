module BCD_ROM(input clk,re,output reg [6:0]data_out,input [3:0]adr);
reg [6:0] ROM[0:15];
initial begin
    ROM[0] = 7'b1111110;
    ROM[1] = 7'b0110000;
    ROM[2] = 7'b1101101;
    ROM[3] = 7'b1111001;
    ROM[4] = 7'b0110011;
    ROM[5] = 7'b1011011;
    ROM[6] = 7'b1011111;
    ROM[7] = 7'b1110000;
    ROM[8] = 7'b1111111;
    ROM[9] = 7'b1111011;
    ROM[10] = 7'bx;
    ROM[11] = 7'bx;
    ROM[12] = 7'bx;
    ROM[13] = 7'bx;
    ROM[14] = 7'bx;
    ROM[15] = 7'bx;
end
always@(posedge clk) begin
    if(re)
        data_out = ROM[adr];
    else
        data_out = 7'b0;
end
endmodule