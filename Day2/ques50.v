module func_even_odd;
  function is_even;
    input [7:0] num;
    begin
      is_even = ~num[0];
    end
  endfunction

  wire result;
  assign result = is_even(8'd14);
endmodule