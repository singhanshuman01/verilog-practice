module pos_neg;
    integer num = -7;

    initial begin
        if (num > 0)
            $display("Positive");
        else if (num < 0)
            $display("Negative");
        else
            $display("Zero");
    end
endmodule