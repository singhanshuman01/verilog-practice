module parameter_RAM(input clk,rst_n,we,re,output reg [DATA_WIDTH-1:0]data_out,input [DATA_WIDTH-1:0]data_in,input [ADDR_WIDTH-1:0]addr);
parameter DATA_WIDTH = 16;
parameter MEMORY_SIZE = 32;
parameter ADDR_WIDTH = $clog2(MEMORY_SIZE);
reg [DATA_WIDTH-1:0] RAM[0:MEMORY_SIZE-1];
integer i;
initial begin
    for(i=0;i<MEMORY_SIZE;i=i+1)
            RAM[i] = i;
end
always@(posedge clk) begin
    if(rst_n) begin
            for(i=0;i<16;i=i+1)
            RAM[i] = 8'd0;
    end
    else if(we==1 && re==0)
        RAM[addr] = data_in;
    else if(re==1 && we == 0)
        data_out = RAM[addr];
        else $display("Invalid condition");
end
endmodule