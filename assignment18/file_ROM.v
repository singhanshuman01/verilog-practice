module file_ROM(output reg [7:0]data_out,input clk,re,input [3:0]addr);
reg [7:0] ROM [0:15];
always@ (addr) begin
    $readmemh("readh.txt",ROM);
    end
always@(posedge clk) begin
			if(re)
        data_out <= ROM[addr];
		  else data_out <= 8'd0;
end

endmodule