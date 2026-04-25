module task_io;
  task compute;
    input  [7:0] a, b;
    output [7:0] sum;
    output [7:0] maximum;
    output        is_even;
    begin
      sum     = a + b;
      maximum = (a > b) ? a : b;
      is_even = ~sum[0];
    end
  endtask
endmodule