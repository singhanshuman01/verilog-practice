module ROM_4x8(input clk,re,output reg [7:0]data_out,input [1:0]addr);
reg [7:0] ROM[0:3];
always@(addr) begin
     case(addr)
    0: ROM[0] = 8'd12;
    1: ROM[1] = 8'd22;
    2: ROM[2] = 8'd43;
    3: ROM[3] = 8'd64;
	 default: $display("Invalid");
    endcase
end
always@(posedge clk) begin
			if(re)
        data_out <= ROM[addr];
		  else data_out <= 8'd0;
end
endmodule