module aos #(
    parameter sel = 0
) (
    output y,
    input a,b
);

generate
    case (sel)

    0: begin : addition
            assign y = a +b;
    end

    1: begin:sub
        assign y = a-b;
    end

    2: begin:multi
        assign y = a*b;
    end

    default: begin: default_
        assign y = 1'b0;
    end                           
    endcase
endgenerate
    
endmodule