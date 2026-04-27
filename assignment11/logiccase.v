module logiccase #(
    parameter mode = 0
) (
    output y, input a,b
);
    generate
        case(mode)
        0 : begin: andblock
         assign y = a^b;
        end

        1 : begin: orblock
            assign y = a|b;
        end

        2: begin: xorblock 
            assign y = a^b;
        end
        default : begin: defaultblock 
            assign y = 1'b0;
        end
        endcase
        
    endgenerate
endmodule