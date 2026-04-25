module count_odd;
  reg [7:0] arr [0:4];

  function [3:0] count_odd_nums;
    input integer size;
    integer i;
    reg [3:0] count;
    begin
      count = 0;
      for (i = 0; i < size; i = i + 1)
        if (arr[i][0] == 1'b1)   // LSB = 1 means odd
          count = count + 1;
      count_odd_nums = count;
    end
  endfunction

  wire [3:0] result;
  assign result = count_odd_nums(5);
endmodule