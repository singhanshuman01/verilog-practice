module alpha_digit;
    reg [7:0] ch = "7";

    initial begin
        if ((ch >= "A" && ch <= "Z") || (ch >= "a" && ch <= "z"))
            $display("Alphabet");
        else if (ch >= "0" && ch <= "9")
            $display("Digit");
        else
            $display("Special Character");
    end
endmodule