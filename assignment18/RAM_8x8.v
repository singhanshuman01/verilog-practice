module RAM_8x8(input clk,rst_n,we,output reg [7:0]data_out,input [7:0]data_in,input [2:0]addr);
reg [7:0] RAM[7:0];
initial begin
    RAM[0] = 8'b1101_0011;
    RAM[1] = 8'b1001_0001;
    RAM[2] = 8'b1111_1011;
    RAM[3] = 8'b1111_1111;
    RAM[4] = 8'b0101_0101;
    RAM[5] = 8'b0111_1011;
    RAM[6] = 8'b0001_0011;
    RAM[7] = 8'b1001_1011;
end
always@(posedge clk) begin
    if(we)
        RAM[addr] = data_in;
    else 
        data_out = RAM[addr];
end
endmodule