module func_mul;
  function [15:0] mul;
    input [7:0] a, b;
    begin
      mul = a * b;
    end
  endfunction

  wire [15:0] result;
  assign result = mul(8'd12, 8'd5);
endmodule