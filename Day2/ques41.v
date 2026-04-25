module min_of_array;
  reg [7:0] arr [0:4];

  function [7:0] array_min;
    input integer size;
    integer i;
    reg [7:0] min_val;
    begin
      min_val = arr[0];
      for (i = 1; i < size; i = i + 1)
        if (arr[i] < min_val)
          min_val = arr[i];
      array_min = min_val;
    end
  endfunction

  wire [7:0] result;
  assign result = array_min(5);
endmodule