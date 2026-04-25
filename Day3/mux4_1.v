module mux4_1 (
    output y,
    input [3:0] a,
    input [1:0] s
);
assign y = s[1]?(s[0]?a[3]:a[2]):(s[0]?a[1]:a[0]);
    
endmodule