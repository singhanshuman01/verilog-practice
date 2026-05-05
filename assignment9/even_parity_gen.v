// ============================================================
// Even Parity Generator using Combinational UDP
// 4 data inputs (d3..d0), parity bit p makes total 1s even
// p = d3 ^ d2 ^ d1 ^ d0
// ============================================================

// UDP for XOR of two bits (building block)
primitive udp_xor2 (y, a, b);
    output y;
    input  a, b;

    table
        // a  b : y
           0  0 : 0;
           0  1 : 1;
           1  0 : 1;
           1  1 : 0;
    endtable
endprimitive


// Even Parity for 4-bit input: p = d3^d2^d1^d0
// Implemented as cascade of XOR2 UDPs
primitive udp_even_parity4 (p, d3, d2, d1, d0);
    output p;
    input  d3, d2, d1, d0;

    table
        // d3 d2 d1 d0 : p
           0  0  0  0  : 0;
           0  0  0  1  : 1;
           0  0  1  0  : 1;
           0  0  1  1  : 0;
           0  1  0  0  : 1;
           0  1  0  1  : 0;
           0  1  1  0  : 0;
           0  1  1  1  : 1;
           1  0  0  0  : 1;
           1  0  0  1  : 0;
           1  0  1  0  : 0;
           1  0  1  1  : 1;
           1  1  0  0  : 0;
           1  1  0  1  : 1;
           1  1  1  0  : 1;
           1  1  1  1  : 0;
    endtable
endprimitive


// Top-level module
module even_parity_gen (
    input  [3:0] data,
    output       parity
);
    udp_even_parity4 U1 (parity, data[3], data[2], data[1], data[0]);
endmodule


// Testbench
module tb_even_parity_gen;
    reg  [3:0] data;
    wire       parity;

    even_parity_gen DUT (.data(data), .parity(parity));

    integer i;
    initial begin
        $display("=== Even Parity Generator Testbench ===");
        $display(" data | parity | transmitted (data+p)");
        $display("------|--------|---------------------");
        for (i = 0; i < 16; i = i + 1) begin
            data = i; #10;
            $display("  %b  |   %b    |     %b%b", data, parity, data, parity);
        end
        $finish;
    end
endmodule
