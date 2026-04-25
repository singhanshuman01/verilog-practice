module reverse_array;
  reg [7:0] arr     [0:4];
  reg [7:0] rev_arr [0:4];

  task array_reverse;
    input integer size;
    integer i;
    begin
      for (i = 0; i < size; i = i + 1)
        rev_arr[i] = arr[size - 1 - i];
    end
  endtask
endmodule