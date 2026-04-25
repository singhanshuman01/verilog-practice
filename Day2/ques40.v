module max_of_array;
  reg [7:0] arr [0:4];

  function [7:0] array_max;
    input integer size;
    integer i;
    reg [7:0] max_val;
    begin
      max_val = arr[0];
      for (i = 1; i < size; i = i + 1)
        if (arr[i] > max_val)
          max_val = arr[i];
      array_max = max_val;
    end
  endfunction

  wire [7:0] result;
  assign result = array_max(5);
endmodule