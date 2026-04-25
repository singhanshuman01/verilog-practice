module sum_n;
    integer i, n = 10;
    integer sum = 0;

    initial begin
        for (i = 1; i <= n; i = i + 1)
            sum = sum + i;

        $display("Sum = %0d", sum);
    end
endmodule