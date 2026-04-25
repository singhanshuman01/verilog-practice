module rem_test;

integer a=50, b=20, c;

initial begin

    c = a % b;

$display("remainder is %0d", c);

end
endmodule
