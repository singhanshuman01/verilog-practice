module parity_eve_4bit (
    output p,
    input [3:0] a
);

assign p = ^a;
    
endmodule