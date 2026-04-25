module mux2_1 (
    output y,
    input [1:0] a,
    input s
);
assign y = s?a[1]:a[0];
    
endmodule