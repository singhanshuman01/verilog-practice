module function_subb;

function  int sub(input int A,B);
    sub = A-B;
endfunction

initial begin
    $display("%0d",sub (10,5));
end
endmodule