module multiplication_table;
    integer i;
    integer num = 5;

    initial begin
        for (i = 1; i <= 10; i = i + 1)
            $display("%0d x %0d = %0d", num, i, num * i);
    end
endmodule