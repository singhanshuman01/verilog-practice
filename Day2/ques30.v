module divisible;
    integer num = 55;

    initial begin
        if (num % 5 == 0 && num % 11 == 0)
            $display("Divisible by both 5 and 11");
        else
            $display("Not divisible by both");
    end
endmodule