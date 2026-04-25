module leap_year;
    integer year = 2024;

    initial begin
        if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))
            $display("Leap Year");
        else
            $display("Not Leap Year");
    end
endmodule