module sum_of_array;
  reg [7:0] arr [0:4];

  function [31:0] array_sum;
    input integer size;
    integer i;
    begin
      array_sum = 0;
      for (i = 0; i < size; i = i + 1)
        array_sum = array_sum + arr[i];
    end
  endfunction

  wire [31:0] result;
  assign result = array_sum(5);
endmodule