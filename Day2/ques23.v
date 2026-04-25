module reverse_count;
    integer i;

    initial begin
        for (i = 20; i >= 1; i = i - 1)
            $display("%0d", i);
    end
endmodule