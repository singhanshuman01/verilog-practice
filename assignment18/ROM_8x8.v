module ROM_8x8(input clk,re,output reg [7:0]data_out,input [3:0]addr);
reg [7:0] ROM[7:0];
initial begin
    ROM[0] = 8'd12;
    ROM[1] = 8'd24;
    ROM[2] = 8'd36;
    ROM[3] = 8'd48;
    ROM[4] = 8'd60;
    ROM[5] = 8'd72;
    ROM[6] = 8'd84;
    ROM[7] = 8'd96; 
end
always@(posedge clk) begin
			if(re)
        data_out <= ROM[addr];
		  else data_out <= 8'd0;
end
endmodule