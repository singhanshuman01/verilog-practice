module comparator_8_bit;
    function equal_8bit;           // 1-bit return by default
        input [7:0] a, b;
        begin
            equal_8bit = (a == b) ? 1'b1 : 1'b0;
        end
    endfunction
endmodule