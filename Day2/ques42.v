module search_array;
  reg [7:0] arr [0:4];

  function [3:0] array_search;
    input [7:0] key;
    integer i;
    reg found;
    begin
      array_search = 4'hF;
      found = 0;
      for (i = 0; i < 5; i = i + 1) begin
        if ((arr[i] == key) && !found) begin
          array_search = i[3:0];
          found = 1;
        end
      end
    end
  endfunction

  wire [3:0] result;
  assign result = array_search(8'd30);
endmodule