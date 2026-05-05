// ============================================================
// Full Subtractor using Combinational UDPs
// Inputs : a (minuend), b (subtrahend), bin (borrow-in)
// Outputs: diff (difference), bout (borrow-out)
// ============================================================

// UDP for Difference: diff = a ^ b ^ bin
primitive udp_full_sub_diff (diff, a, b, bin);
    output diff;
    input  a, b, bin;

    table
        // a  b  bin : diff
           0  0   0  :  0;
           0  0   1  :  1;
           0  1   0  :  1;
           0  1   1  :  0;
           1  0   0  :  1;
           1  0   1  :  0;
           1  1   0  :  0;
           1  1   1  :  1;
    endtable
endprimitive


// UDP for Borrow-out: bout = (~a & b) | (~a & bin) | (b & bin)
primitive udp_full_sub_bout (bout, a, b, bin);
    output bout;
    input  a, b, bin;

    table
        // a  b  bin : bout
           0  0   0  :  0;
           0  0   1  :  1;
           0  1   0  :  1;
           0  1   1  :  1;
           1  0   0  :  0;
           1  0   1  :  0;
           1  1   0  :  0;
           1  1   1  :  1;
    endtable
endprimitive


// Top-level module instantiating both UDPs
module full_subtractor (
    input  a, b, bin,
    output diff, bout
);
    udp_full_sub_diff U1 (diff, a, b, bin);
    udp_full_sub_bout U2 (bout, a, b, bin);
endmodule


// Testbench
module tb_full_subtractor;
    reg  a, b, bin;
    wire diff, bout;

    full_subtractor DUT (.a(a), .b(b), .bin(bin), .diff(diff), .bout(bout));

    initial begin
        $display("=== Full Subtractor Testbench ===");
        $display(" a  b bin | diff bout");
        $display("----------|----------");
        {a, b, bin} = 3'b000; #10;
        $display(" %b  %b  %b  |   %b    %b", a, b, bin, diff, bout);
        {a, b, bin} = 3'b001; #10;
        $display(" %b  %b  %b  |   %b    %b", a, b, bin, diff, bout);
        {a, b, bin} = 3'b010; #10;
        $display(" %b  %b  %b  |   %b    %b", a, b, bin, diff, bout);
        {a, b, bin} = 3'b011; #10;
        $display(" %b  %b  %b  |   %b    %b", a, b, bin, diff, bout);
        {a, b, bin} = 3'b100; #10;
        $display(" %b  %b  %b  |   %b    %b", a, b, bin, diff, bout);
        {a, b, bin} = 3'b101; #10;
        $display(" %b  %b  %b  |   %b    %b", a, b, bin, diff, bout);
        {a, b, bin} = 3'b110; #10;
        $display(" %b  %b  %b  |   %b    %b", a, b, bin, diff, bout);
        {a, b, bin} = 3'b111; #10;
        $display(" %b  %b  %b  |   %b    %b", a, b, bin, diff, bout);
        $finish;
    end
endmodule
