module func_sub;
  function [7:0] sub;
    input [7:0] a, b;
    begin
      sub = a - b;
    end
  endfunction

  wire [7:0] result;
  assign result = sub(8'd25, 8'd10);
endmodule