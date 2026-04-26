module oddeve (
    input [7:0] a
);

initial begin
    if(^a == 1)begin
        $display("even parity\n");
    end
    if(~^a == 1)begin
        $display("odd parity\n");
        
    end
end
    
endmodule