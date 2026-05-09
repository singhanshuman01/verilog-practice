module RAM_dualport(input clka,clkb,wea,web,rea,reb,output reg [7:0]data_outa,data_outb,input [7:0]data_ina,data_inb,input [2:0]addra,addrb);
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
always@(posedge clka) begin
    if(wea)
       RAM[addra] <= data_ina;
    else
        data_outa <= RAM[addra];
end
always@(posedge clka) begin
     if(web) 
        RAM[addrb] <= data_inb;
    else 
        data_outb <= RAM[addrb];
end

endmodule