module vowel_check;
    reg [7:0] ch = "a";

    initial begin
        if (ch=="a"||ch=="e"||ch=="i"||ch=="o"||ch=="u"||
            ch=="A"||ch=="E"||ch=="I"||ch=="O"||ch=="U")
            $display("Vowel");
        else
            $display("Consonant");
    end
endmodule