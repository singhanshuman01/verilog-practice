module function_example;

function int add(input int a, b);
    add = a+b;
endfunction

initial begin
    
    $display("sum of two no %0d", add(5,10));

end
endmodule

