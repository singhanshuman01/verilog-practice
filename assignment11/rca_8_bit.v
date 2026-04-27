module faa (
    output sum,carry,
    input a,b,cin
);

wire [2:0]t;
//sum
xor x1(t[0],a,b),
    x2(sum,t[0],cin);

//caaary
and y1(t[1],a,b),
    y2(t[2],t[0],cin);

or o1(carry,t[1],t[2]);

endmodule


module rca8 #( parameter N = 8) (
    output [N-1:0]sum,output cout,
    input [N-1:0]a,b,
    input cin
);

wire [N:0]w;
assign w[0] = cin;
genvar i;
generate
    for (i = 0 ; i<N ; i=i+1 ) begin: rca8
        faa fa1(sum[i], w[i+1], a[i],b[i],w[i]);
    end
endgenerate
assign cout = w[N-1];

endmodule