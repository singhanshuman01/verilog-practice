module majority(
    input [3:0] a,
    output y
);
reg w;
initial begin
    w = (a[0]&a[1])|(a[1]&a[2])|(a[0]&a[2]);
    if (w) begin
        $display(1'b1);
    end else begin
        $display(1'b0);
    end
end
    
endmodule