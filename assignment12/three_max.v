module three_max;
    function [7:0] max_of_three;
        input [7:0] a, b, c;
        begin
            if (a >= b && a >= c)
                max_of_three = a;
            else if (b >= a && b >= c)
                max_of_three = b;
            else
                max_of_three = c;
        end
    endfunction
endmodule