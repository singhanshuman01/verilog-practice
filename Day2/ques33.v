module grade_calc;
    integer marks = 78;

    initial begin
        if (marks >= 90)
            $display("Grade A");
        else if (marks >= 75)
            $display("Grade B");
        else if (marks >= 60)
            $display("Grade C");
        else if (marks >= 40)
            $display("Grade D");
        else
            $display("Fail");
    end
endmodule