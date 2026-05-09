module synasyn_RAM(input clk,rst_n,we,re,output reg [7:0]data_out,input [7:0]data_in,input [3:0]addr);
reg [7:0] RAM[0:15];
initial begin
    RAM[0] = 8'd1;
    RAM[1] = 8'd2;
    RAM[2] = 8'd3;
    RAM[3] = 8'd4;
    RAM[4] = 8'd5;
    RAM[5] = 8'd6;
    RAM[6] = 8'd7;
    RAM[7] = 8'd8;
    RAM[8] = 8'd9;
    RAM[9] = 8'd10;
    RAM[10] = 8'd11;
    RAM[11] = 8'd12;
    RAM[12] = 8'd13;
    RAM[13] = 8'd14;
    RAM[14] = 8'd15;
    RAM[15] = 8'd0;
end
always@(posedge clk) begin
    if(we)
        RAM[addr] <= data_in;
        else if(re==1 && we == 1)$display("Invalid condition");
end
always@(data_in or we or re or addr) begin
    if(re)
        data_out <= RAM[addr];
        else if(re==1 && we == 1)$display("Invalid condition");
end
endmodule