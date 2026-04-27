module nbitxor #(
    parameter N = 4
) (
    output [N-1:0]y,
    input [N-1:0]a, b
);

genvar i;
generate
    
for (i = 0; i<N ; i=i+1 ) begin : nbitxor
        assign y[i] = a[i]^b[i];
    end 
endgenerate 

    
endmodule