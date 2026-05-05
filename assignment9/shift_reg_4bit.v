// ============================================================
// 4-bit Serial-In Parallel-Out (SIPO) Shift Register
// using Sequential UDP (Positive Edge D Flip-Flop)
//
// Operation:
//   - On each positive clock edge, data shifts left:
//       Q[0] <- sin (serial input)
//       Q[1] <- Q[0]
//       Q[2] <- Q[1]
//       Q[3] <- Q[2]
//   - On reset: all Q bits cleared to 0
//   - Parallel output available on Q[3:0]
//   - Serial output (MSB) available on Q[3]
//
// Shift direction: sin -> Q[0] -> Q[1] -> Q[2] -> Q[3] -> sout
// ============================================================

`include "udp_dff.v"

module shift_reg_4bit (
    input      clk,
    input      rst,    // active-high synchronous reset
    input      sin,    // serial data input
    output [3:0] Q,    // parallel output
    output       sout  // serial output (MSB)
);
    wire d0, d1, d2, d3;

    // D inputs: shift right with sin at LSB; rst clears all
    assign d0 = rst ? 1'b0 : sin;
    assign d1 = rst ? 1'b0 : Q[0];
    assign d2 = rst ? 1'b0 : Q[1];
    assign d3 = rst ? 1'b0 : Q[2];

    // Four cascaded positive-edge D flip-flops
    udp_dff FF0 (Q[0], clk, d0);
    udp_dff FF1 (Q[1], clk, d1);
    udp_dff FF2 (Q[2], clk, d2);
    udp_dff FF3 (Q[3], clk, d3);

    // Serial output is the MSB
    assign sout = Q[3];

endmodule


// Testbench
module tb_shift_reg_4bit;
    reg  clk, rst, sin;
    wire [3:0] Q;
    wire       sout;

    shift_reg_4bit DUT (.clk(clk), .rst(rst), .sin(sin), .Q(Q), .sout(sout));

    always #5 clk = ~clk;

    initial begin
        $display("=== 4-bit Shift Register Testbench ===");
        $display("Shifting in serial pattern: 1, 0, 1, 1, 0, 0, 1, 1");
        $display("");
        $display("Time | sin | Q[3] Q[2] Q[1] Q[0] | sout");
        $display("-----|-----|---------------------|-----");

        clk = 0; rst = 1; sin = 0;
        @(posedge clk); #1;
        $display("%4t |  %b  |  %b     %b     %b     %b  |  %b   (reset)", $time, sin, Q[3], Q[2], Q[1], Q[0], sout);

        rst = 0;

        // Shift in: 1, 0, 1, 1, 0, 0, 1, 1
        // After 4 clocks Q should hold the last 4 bits shifted in
        begin
            sin = 1; @(posedge clk); #1;
            $display("%4t |  %b  |  %b     %b     %b     %b  |  %b", $time, sin, Q[3], Q[2], Q[1], Q[0], sout);
            sin = 0; @(posedge clk); #1;
            $display("%4t |  %b  |  %b     %b     %b     %b  |  %b", $time, sin, Q[3], Q[2], Q[1], Q[0], sout);
            sin = 1; @(posedge clk); #1;
            $display("%4t |  %b  |  %b     %b     %b     %b  |  %b", $time, sin, Q[3], Q[2], Q[1], Q[0], sout);
            sin = 1; @(posedge clk); #1;
            $display("%4t |  %b  |  %b     %b     %b     %b  |  %b", $time, sin, Q[3], Q[2], Q[1], Q[0], sout);
            sin = 0; @(posedge clk); #1;
            $display("%4t |  %b  |  %b     %b     %b     %b  |  %b", $time, sin, Q[3], Q[2], Q[1], Q[0], sout);
            sin = 0; @(posedge clk); #1;
            $display("%4t |  %b  |  %b     %b     %b     %b  |  %b", $time, sin, Q[3], Q[2], Q[1], Q[0], sout);
            sin = 1; @(posedge clk); #1;
            $display("%4t |  %b  |  %b     %b     %b     %b  |  %b", $time, sin, Q[3], Q[2], Q[1], Q[0], sout);
            sin = 1; @(posedge clk); #1;
            $display("%4t |  %b  |  %b     %b     %b     %b  |  %b", $time, sin, Q[3], Q[2], Q[1], Q[0], sout);
        end

        $display("");
        $display("Note: Q[0]=first in (LSB), Q[3]=last retained (MSB/sout)");
        $display("After 4 clocks of 1,0,1,1 -> Q should be 1101 (MSB first: last 4 shifted bits)");
        $finish;
    end
endmodule
