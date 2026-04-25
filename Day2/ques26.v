module largest_of_three;
    integer a = 10, b = 25, c = 15;
    integer largest;

    initial begin
        if (a >= b && a >= c)
            largest = a;
        else if (b >= a && b >= c)
            largest = b;
        else
            largest = c;

        $display("Largest = %0d", largest);
    end
endmodule