module avg_of_array;
  reg [7:0] arr [0:4];

  function [31:0] array_avg;
    input integer size;
    integer i;
    reg [31:0] sum;
    begin
      sum = 0;
      for (i = 0; i < size; i = i + 1)
        sum = sum + arr[i];
      array_avg = sum / size;
    end
  endfunction

  wire [31:0] result;
  assign result = array_avg(5);
endmodule