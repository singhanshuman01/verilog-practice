module parameter_ROM(input clk,re,output reg [DATA_WIDTH-1:0]data_out,input [ADDR_WIDTH-1:0]addr);
parameter DATA_WIDTH = 16;
parameter MEMORY_SIZE = 32;
parameter ADDR_WIDTH = $clog2(MEMORY_SIZE);
reg [DATA_WIDTH-1:0] ROM[0:MEMORY_SIZE-1];
integer i;
initial begin
    for(i=0;i<MEMORY_SIZE;i=i+1)
            ROM[i] = i;
end
always@(posedge clk) begin
    if(re)
        data_out = ROM[addr];
    else
        data_out = 15'd0;
end
endmodule