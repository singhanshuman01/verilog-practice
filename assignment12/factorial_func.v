module factorial_func;
    function automatic [31:0] factorial;
        input [4:0] n;   // supports up to 31! before overflow
        begin
            if (n == 0 || n == 1)
                factorial = 1;
            else
                factorial = n * factorial(n - 1);
        end
    endfunction
endmodule