module fibonacci;
    task fibonacci;
        input integer N;
        integer i;
        integer a, b, temp;
        begin
            $display("\n--- Fibonacci Series: First %0d Numbers ---", N);
            a = 0; b = 1;
            if (N >= 1) $display("  F[0] = %0d", a);
            if (N >= 2) $display("  F[1] = %0d", b);
            for (i = 2; i < N; i = i + 1) begin
                temp = a + b;
                a    = b;
                b    = temp;
                $display("  F[%0d] = %0d", i, b);
            end
        end
    endtask
endmodule