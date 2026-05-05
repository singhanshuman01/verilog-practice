// ============================================================
// 4-bit Binary to Gray Code Converter using Combinational UDPs
// Gray Code Conversion:
//   G3 = B3
//   G2 = B3 ^ B2
//   G1 = B2 ^ B1
//   G0 = B1 ^ B0
// ============================================================

// UDP: MSB Gray bit (G3 = B3, just a buffer)
primitive udp_gray_msb (g, b);
    output g;
    input  b;

    table
        // b : g
           0 : 0;
           1 : 1;
    endtable
endprimitive


// UDP: XOR of two adjacent binary bits for gray code
primitive udp_gray_xor (g, bh, bl);
    output g;
    input  bh, bl;

    table
        // bh bl : g
           0   0 : 0;
           0   1 : 1;
           1   0 : 1;
           1   1 : 0;
    endtable
endprimitive


// Top-level module: 4-bit Binary to Gray
module bin2gray4 (
    input  [3:0] bin,
    output [3:0] gray
);
    udp_gray_msb  U3 (gray[3], bin[3]);
    udp_gray_xor  U2 (gray[2], bin[3], bin[2]);
    udp_gray_xor  U1 (gray[1], bin[2], bin[1]);
    udp_gray_xor  U0 (gray[0], bin[1], bin[0]);
endmodule


// Testbench
module tb_bin2gray4;
    reg  [3:0] bin;
    wire [3:0] gray;

    bin2gray4 DUT (.bin(bin), .gray(gray));

    integer i;
    initial begin
        $display("=== 4-bit Binary to Gray Code Converter Testbench ===");
        $display(" Binary | Gray");
        $display("--------|-----");
        for (i = 0; i < 16; i = i + 1) begin
            bin = i; #10;
            $display("  %b  | %b", bin, gray);
        end
        $finish;
    end
endmodule
