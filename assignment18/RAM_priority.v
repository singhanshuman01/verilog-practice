module RAM_priority(input clk,wea,web,reb,rea,output reg [7:0]data_outa,data_outb,input [7:0]data_ina,data_inb,input [2:0]addra,addrb);
reg [7:0] RAM[0:7];
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
    if(wea == 1 && web == 1) begin
       RAM[addra] <= data_ina;
       RAM[addrb] <= 8'bz;
    end
    else if(reb) 
        data_outb <= RAM[addrb];
    
    else if(rea)
        data_outa <= RAM[addra];
        else  begin 
             data_outa <= 8'b0;
             data_outb <= 8'b0;
        end
    
end

endmodule