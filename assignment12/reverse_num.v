module reverse_num;
    function [7:0] number_reversal;
        input [7:0] data;
        integer i;
        begin
            for (i = 0; i < 8; i = i + 1)
                number_reversal[i] = data[7 - i];
        end
    endfunction
endmodule