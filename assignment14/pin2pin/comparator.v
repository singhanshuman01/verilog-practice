module comp4(output eq, input [3:0] a, b);
  wire [3:0] x;

  xor #(2) x0 (x[0], a[0], b[0]);
  xor #(2) x1 (x[1], a[1], b[1]);
  xor #(2) x2 (x[2], a[2], b[2]);
  xor #(2) x3 (x[3], a[3], b[3]);

  nor #(3) n1 (eq, x[0], x[1], x[2], x[3]);
endmodule