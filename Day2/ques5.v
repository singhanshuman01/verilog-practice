module div_test;

integer a=40, b=2, c;

initial begin

    c = a/b;

$display("division is %0d", c);

end
endmodule
