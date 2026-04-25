module factorial;
    integer i, n = 5;
    integer fact = 1;

    initial begin
        for (i = 1; i <= n; i = i + 1)
            fact = fact * i;

        $display("Factorial = %0d", fact);
    end
endmodule