// ============================================================
// Custom Logic Function using Combinational UDP
// Output = 1 when input is 000, 110, or 111
// Output = 0 otherwise (001, 010, 011, 100, 101)
// Truth Table:
//   000 -> 1
//   001 -> 0
//   010 -> 0
//   011 -> 0
//   100 -> 0
//   101 -> 0
//   110 -> 1
//   111 -> 1
// ============================================================

primitive udp_custom_logic (y, a, b, c);
    output y;
    input  a, b, c;

    table
        // a  b  c : y
           0  0  0 : 1;   // 000 -> 1
           0  0  1 : 0;   // 001 -> 0
           0  1  0 : 0;   // 010 -> 0
           0  1  1 : 0;   // 011 -> 0
           1  0  0 : 0;   // 100 -> 0
           1  0  1 : 0;   // 101 -> 0
           1  1  0 : 1;   // 110 -> 1
           1  1  1 : 1;   // 111 -> 1
    endtable
endprimitive


// Top-level module
module custom_logic (
    input  a, b, c,
    output y
);
    udp_custom_logic U1 (y, a, b, c);
endmodule


// Testbench
module tb_custom_logic;
    reg  a, b, c;
    wire y;

    custom_logic DUT (.a(a), .b(b), .c(c), .y(y));

    initial begin
        $display("=== Custom Logic Function Testbench ===");
        $display(" a  b  c | y  (expect 1 for 000,110,111)");
        $display("---------|-------------------------------");
        {a, b, c} = 3'b000; #10; $display(" %b  %b  %b | %b", a, b, c, y);
        {a, b, c} = 3'b001; #10; $display(" %b  %b  %b | %b", a, b, c, y);
        {a, b, c} = 3'b010; #10; $display(" %b  %b  %b | %b", a, b, c, y);
        {a, b, c} = 3'b011; #10; $display(" %b  %b  %b | %b", a, b, c, y);
        {a, b, c} = 3'b100; #10; $display(" %b  %b  %b | %b", a, b, c, y);
        {a, b, c} = 3'b101; #10; $display(" %b  %b  %b | %b", a, b, c, y);
        {a, b, c} = 3'b110; #10; $display(" %b  %b  %b | %b", a, b, c, y);
        {a, b, c} = 3'b111; #10; $display(" %b  %b  %b | %b", a, b, c, y);
        $finish;
    end
endmodule
