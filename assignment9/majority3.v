// ============================================================
// Three-Input Majority Function using Combinational UDP
// Output = 1 when majority (2 or more) of inputs are 1
// Output = (a&b) | (b&c) | (a&c)
// ============================================================

primitive udp_majority3 (y, a, b, c);
    output y;
    input  a, b, c;

    table
        // a  b  c : y
           0  0  0 : 0;
           0  0  1 : 0;
           0  1  0 : 0;
           0  1  1 : 1;
           1  0  0 : 0;
           1  0  1 : 1;
           1  1  0 : 1;
           1  1  1 : 1;
    endtable
endprimitive


// Top-level module
module majority3 (
    input  a, b, c,
    output y
);
    udp_majority3 U1 (y, a, b, c);
endmodule


// Testbench
module tb_majority3;
    reg  a, b, c;
    wire y;

    majority3 DUT (.a(a), .b(b), .c(c), .y(y));

    initial begin
        $display("=== Three-Input Majority Function Testbench ===");
        $display(" a  b  c | y");
        $display("---------|--");
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
