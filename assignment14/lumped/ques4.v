module aand_gate (
    output y, input a,b
);

assign #3 y = a&b;
    
endmodule