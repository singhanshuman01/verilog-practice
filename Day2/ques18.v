module fibonacci;
    integer i;
    integer a = 0, b = 1, next;

    initial begin
        $display("%0d", a);
        $display("%0d", b);

        for (i = 2; i < 10; i = i + 1) begin
            next = a + b;
            $display("%0d", next);
            a = b;
            b = next;
        end
    end
endmodule