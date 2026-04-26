module comp8 (
    input [7:0] a,b
);
initial begin
    
if(a>b) begin
    $display("A is greater than B\n");
end else if(a==b)
     $display("A is equal to B\n");
else begin
    $display("A is less than B\n");
end
end
    
endmodule