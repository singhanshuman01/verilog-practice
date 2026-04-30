module hamming;
    function [3:0] hamming_distance;
        input [3:0] a, b;
        reg   [3:0] diff;
        integer i;
        begin
            diff = a ^ b;          // XOR gives differing bits
            hamming_distance = 0;
            for (i = 0; i < 4; i = i + 1)
                hamming_distance = hamming_distance + diff[i];
        end
    endfunction
endmodule