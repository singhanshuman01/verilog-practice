module add_test;

integer a=10, b=20, c;

initial begin

    c = a + b;

$display("sum is %0d", c);

end
endmodule
