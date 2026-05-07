module y(output out , input m,n,p,q);

reg e,f,g;

initial begin
    
fork 
    #11  e = m|n;
    #8  f = p&q;
join
    #4 g = e|f;
end
assign out = g;

endmodule