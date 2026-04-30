module reverse_bitwise;
    function [7:0] bit_reverse_8;
        input [7:0] data;
        integer i;
        begin
            for (i = 0; i < 8; i = i + 1)
                bit_reverse_8[i] = data[7 - i];
        end
    endfunction
endmodule