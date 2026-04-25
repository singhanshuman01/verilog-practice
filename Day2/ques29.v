module prime_check;
    integer num = 7;
    integer i;
    integer is_prime = 1;

    initial begin
        if (num <= 1)
            is_prime = 0;
        else begin
            for (i = 2; i < num; i = i + 1) begin
                if (num % i == 0)
                    is_prime = 0;
            end
        end

        if (is_prime)
            $display("Prime");
        else
            $display("Not Prime");
    end
endmodule