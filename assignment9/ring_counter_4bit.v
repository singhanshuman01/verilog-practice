// ============================================================
// 4-bit Ring Counter using Sequential UDP (Positive Edge D-FF)
// Operation:
//   - Single '1' circulates through 4 FFs on each clock edge
//   - On reset: Q = 4'b0001 (seed bit in LSB)
//   - Sequence: 0001 -> 0010 -> 0100 -> 1000 -> 0001 -> ...
// ============================================================

`include "udp_dff.v"

module ring_counter_4bit (
    input      clk,
    input      rst,   // active-high synchronous reset
    output [3:0] Q
);
    wire d0, d1, d2, d3;

    // On reset, inject 1 into Q[0]; otherwise shift left (rotate)
    // d0 gets Q[3] (wrap-around) unless reset -> then 1
    // d1 gets Q[0], d2 gets Q[1], d3 gets Q[2]
    // Since UDP DFF has no reset pin, we use mux logic on D inputs

    // Mux: di = rst ? seed_i : Q[i-1]
    // seed = 0001  =>  d0=1, d1=0, d2=0, d3=0 when rst=1
    assign d0 = rst ? 1'b1 : Q[3];   // wrap-around or seed
    assign d1 = rst ? 1'b0 : Q[0];
    assign d2 = rst ? 1'b0 : Q[1];
    assign d3 = rst ? 1'b0 : Q[2];

    // Instantiate four positive-edge D flip-flops
    udp_dff FF0 (Q[0], clk, d0);
    udp_dff FF1 (Q[1], clk, d1);
    udp_dff FF2 (Q[2], clk, d2);
    udp_dff FF3 (Q[3], clk, d3);

endmodule


// Testbench
module tb_ring_counter_4bit;
    reg  clk, rst;
    wire [3:0] Q;

    ring_counter_4bit DUT (.clk(clk), .rst(rst), .Q(Q));

    // Clock: 10ns period
    always #5 clk = ~clk;

    initial begin
        $display("=== 4-bit Ring Counter Testbench ===");
        $display("Time | clk rst | Q[3] Q[2] Q[1] Q[0]");
        $display("-----|---------|--------------------");

        clk = 0; rst = 1;
        @(posedge clk); #1;
        $display("%4t |  %b   %b  |  %b     %b     %b     %b", $time, clk, rst, Q[3], Q[2], Q[1], Q[0]);

        rst = 0;
        repeat (10) begin
            @(posedge clk); #1;
            $display("%4t |  %b   %b  |  %b     %b     %b     %b", $time, clk, rst, Q[3], Q[2], Q[1], Q[0]);
        end

        $display("");
        $display("Expected sequence: 0001->0010->0100->1000->0001->...");
        $finish;
    end
endmodule
