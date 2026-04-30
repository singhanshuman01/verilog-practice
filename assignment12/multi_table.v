module multi_table;
    task multiplication_table;
        input [7:0] num;
        integer i;
        begin
            $display("\n--- Multiplication Table of %0d ---", num);
            for (i = 1; i <= 10; i = i + 1)
                $display("%0d x %0d = %0d", num, i, num * i);
        end
    endtask
endmodule