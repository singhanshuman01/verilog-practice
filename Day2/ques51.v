module func_max;
  function [7:0] max;
    input [7:0] a, b;
    begin
      max = (a > b) ? a : b;
    end
  endfunction

  wire [7:0] result;
  assign result = max(8'd47, 8'd83);
endmodule