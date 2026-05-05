// ============================================================
// 8:3 Encoder using Combinational UDPs
// Priority encoder: highest active input sets binary output
// Inputs : i7..i0 (i7 = highest priority)
// Outputs: y2, y1, y0 (3-bit encoded output), valid (any input active)
//
// Encoding (priority, highest first):
//   i7=1 -> 111
//   i6=1 -> 110
//   i5=1 -> 101
//   i4=1 -> 100
//   i3=1 -> 011
//   i2=1 -> 010
//   i1=1 -> 001
//   i0=1 -> 000
// ============================================================

// UDP for Y2 (MSB): high when i4..i7 active (any of them highest)
// Y2 = i7 | i6 | i5 | i4
primitive udp_enc_y2 (y2, i7, i6, i5, i4, i3, i2, i1, i0);
    output y2;
    input  i7, i6, i5, i4, i3, i2, i1, i0;

    table
        // i7 i6 i5 i4 i3 i2 i1 i0 : y2
           1  ?  ?  ?  ?  ?  ?  ?  :  1;
           0  1  ?  ?  ?  ?  ?  ?  :  1;
           0  0  1  ?  ?  ?  ?  ?  :  1;
           0  0  0  1  ?  ?  ?  ?  :  1;
           0  0  0  0  ?  ?  ?  ?  :  0;
    endtable
endprimitive


// UDP for Y1: high when i7,i6 active OR i3,i2 active (as highest)
// Y1 = i7 | i6 | (~i7 & ~i6 & ~i5 & ~i4 & i3) | (~i7 & ~i6 & ~i5 & ~i4 & i2)
primitive udp_enc_y1 (y1, i7, i6, i5, i4, i3, i2, i1, i0);
    output y1;
    input  i7, i6, i5, i4, i3, i2, i1, i0;

    table
        // i7 i6 i5 i4 i3 i2 i1 i0 : y1
           1  ?  ?  ?  ?  ?  ?  ?  :  1;
           0  1  ?  ?  ?  ?  ?  ?  :  1;
           0  0  1  ?  ?  ?  ?  ?  :  0;
           0  0  0  1  ?  ?  ?  ?  :  0;
           0  0  0  0  1  ?  ?  ?  :  1;
           0  0  0  0  0  1  ?  ?  :  1;
           0  0  0  0  0  0  1  ?  :  0;
           0  0  0  0  0  0  0  1  :  0;
           0  0  0  0  0  0  0  0  :  0;
    endtable
endprimitive


// UDP for Y0 (LSB)
// Y0 = i7 | (~i7&~i6&i5) | (~i7&~i6&~i5&~i4&i3) | (~i7&~i6&~i5&~i4&~i3&~i2&i1)
primitive udp_enc_y0 (y0, i7, i6, i5, i4, i3, i2, i1, i0);
    output y0;
    input  i7, i6, i5, i4, i3, i2, i1, i0;

    table
        // i7 i6 i5 i4 i3 i2 i1 i0 : y0
           1  ?  ?  ?  ?  ?  ?  ?  :  1;
           0  1  ?  ?  ?  ?  ?  ?  :  0;
           0  0  1  ?  ?  ?  ?  ?  :  1;
           0  0  0  1  ?  ?  ?  ?  :  0;
           0  0  0  0  1  ?  ?  ?  :  1;
           0  0  0  0  0  1  ?  ?  :  0;
           0  0  0  0  0  0  1  ?  :  1;
           0  0  0  0  0  0  0  1  :  0;
           0  0  0  0  0  0  0  0  :  0;
    endtable
endprimitive


// UDP for valid output: at least one input is high
primitive udp_enc_valid (valid, i7, i6, i5, i4, i3, i2, i1, i0);
    output valid;
    input  i7, i6, i5, i4, i3, i2, i1, i0;

    table
        // i7 i6 i5 i4 i3 i2 i1 i0 : valid
           1  ?  ?  ?  ?  ?  ?  ?  :  1;
           0  1  ?  ?  ?  ?  ?  ?  :  1;
           0  0  1  ?  ?  ?  ?  ?  :  1;
           0  0  0  1  ?  ?  ?  ?  :  1;
           0  0  0  0  1  ?  ?  ?  :  1;
           0  0  0  0  0  1  ?  ?  :  1;
           0  0  0  0  0  0  1  ?  :  1;
           0  0  0  0  0  0  0  1  :  1;
           0  0  0  0  0  0  0  0  :  0;
    endtable
endprimitive


// Top-level module
module encoder_8to3 (
    input  [7:0] in,
    output [2:0] y,
    output       valid
);
    udp_enc_y2    U2 (y[2], in[7], in[6], in[5], in[4], in[3], in[2], in[1], in[0]);
    udp_enc_y1    U1 (y[1], in[7], in[6], in[5], in[4], in[3], in[2], in[1], in[0]);
    udp_enc_y0    U0 (y[0], in[7], in[6], in[5], in[4], in[3], in[2], in[1], in[0]);
    udp_enc_valid UV (valid, in[7], in[6], in[5], in[4], in[3], in[2], in[1], in[0]);
endmodule


// Testbench
module tb_encoder_8to3;
    reg  [7:0] in;
    wire [2:0] y;
    wire       valid;

    encoder_8to3 DUT (.in(in), .y(y), .valid(valid));

    initial begin
        $display("=== 8:3 Priority Encoder Testbench ===");
        $display("    Input    | Output | Valid");
        $display("-------------|--------|------");
        in = 8'b00000000; #10; $display(" %b |   %b  |   %b", in, y, valid);
        in = 8'b00000001; #10; $display(" %b |   %b  |   %b", in, y, valid);
        in = 8'b00000010; #10; $display(" %b |   %b  |   %b", in, y, valid);
        in = 8'b00000100; #10; $display(" %b |   %b  |   %b", in, y, valid);
        in = 8'b00001000; #10; $display(" %b |   %b  |   %b", in, y, valid);
        in = 8'b00010000; #10; $display(" %b |   %b  |   %b", in, y, valid);
        in = 8'b00100000; #10; $display(" %b |   %b  |   %b", in, y, valid);
        in = 8'b01000000; #10; $display(" %b |   %b  |   %b", in, y, valid);
        in = 8'b10000000; #10; $display(" %b |   %b  |   %b", in, y, valid);
        in = 8'b10110101; #10; $display(" %b |   %b  |   %b (priority: i7)", in, y, valid);
        in = 8'b01101010; #10; $display(" %b |   %b  |   %b (priority: i6)", in, y, valid);
        $finish;
    end
endmodule
