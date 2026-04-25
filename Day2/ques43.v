module count_even;
  reg [7:0] arr [0:4];

  function [3:0] count_even_nums;
    input integer size;
    integer i;
    reg [3:0] count;
    begin
      count = 0;
      for (i = 0; i < size; i = i + 1)
        if (arr[i][0] == 1'b0)
          count = count + 1;
      count_even_nums = count;
    end
  endfunction

  wire [3:0] result;
  assign result = count_even_nums(5);
endmodule