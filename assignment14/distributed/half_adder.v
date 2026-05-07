module half_adder_dd(output reg sum, carry, input a, b);
  always @(a or b) begin
    sum   = #2 a ^ b;
    carry = #2 a & b;
  end
endmodule