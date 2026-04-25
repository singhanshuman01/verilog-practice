module func_fibonacci;
  function [31:0] fibonacci;
    input [4:0] n;
    integer i;
    reg [31:0] a, b, temp;
    begin
      a = 0; b = 1;
      if (n == 0)
        fibonacci = 0;
      else begin
        for (i = 1; i < n; i = i + 1) begin
          temp = a + b;
          a    = b;
          b    = temp;
        end
        fibonacci = b;
      end
    end
  endfunction

  wire [31:0] result;
  assign result = fibonacci(5'd8);  // 8th Fibonacci = 21
endmodule