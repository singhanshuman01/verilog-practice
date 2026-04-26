module updown4b(
    input clk, mode,
    output reg [3:0] count
);
initial count=4'b0;
always @(clk) begin
    if(mode==0) count=count+1'b1;
    else if(mode==1) count = count-1'b1;
end

endmodule
