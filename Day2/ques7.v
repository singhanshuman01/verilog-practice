module even_odd;

int a=23, b=44;

initial begin

    if(a%2 == 0)
    $display("no. %0d is even",a);
    else
    $display("no. %0d is odd",a);

    
    if(b%2 == 0)
    $display("no. %0d is even",b);
    else
    $display("no. %0d is odd",b);

end

endmodule



