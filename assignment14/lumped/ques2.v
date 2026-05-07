module ques2(
    output y , input m,n,p,q
);
    wire e,f;
    reg g;
    assign e = m|n;
    assign f = p&q;
    assign #15 y = e|f;
    
endmodule