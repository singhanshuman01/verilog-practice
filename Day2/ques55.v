module func_factorial;
  function [31:0] factorial;
    input [4:0] n;
    integer i;
    begin
      factorial = 1;
      for (i = 1; i <= n; i = i + 1)
        factorial = factorial * i;
    end
  endfunction

  wire [31:0] result;
  assign result = factorial(5'd6);  // 6! = 720
endmodule