module sum_odd;
    integer i;
    integer sum = 0;

    initial begin
        for (i = 1; i <= 20; i = i + 1) begin
            if (i % 2 != 0)
                sum = sum + i;
        end
        $display("Sum of odd = %0d", sum);
    end
endmodule