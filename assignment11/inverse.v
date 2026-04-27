module inverse #(parameter inv = 1)(output y,
                input a);

generate
    if(inv)begin:inverse
        assign y = ~a;
    end else begin:no_change
        assign y = a;
    end
endgenerate


endmodule
