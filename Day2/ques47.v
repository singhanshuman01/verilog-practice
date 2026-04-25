module func_add;
  function [7:0] add;
    input [7:0] a, b;
    begin
      add = a + b;
    end
  endfunction

  wire [7:0] result;
  assign result = add(8'd25, 8'd10);
endmodule