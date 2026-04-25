module task_arithmetic;
  task arithmetic;
    input  [7:0] a, b;
    output [7:0] sum, diff, prod;
    begin
      sum  = a + b;
      diff = a - b;
      prod = a * b;
    end
  endtask

  wire [7:0] s, d, p;
endmodule