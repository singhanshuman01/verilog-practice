// ============================================================
// 3-bit Synchronous Down Counter using Sequential UDP (Pos-Edge D-FF)
// Operation:
//   - On reset: Q = 3'b111 (starts at 7)
//   - Counts down: 7->6->5->4->3->2->1->0->7->...
//   - Next state logic (combinational):
//       Q[0]_next = ~Q[0]
//       Q[1]_next = Q[1] ^ ~Q[0]          (toggle when Q[0]=0)
//       Q[2]_next = Q[2] ^ (~Q[1] & ~Q[0]) (toggle when Q[1:0]=00)
// ============================================================

`include "udp_dff.v"

module down_counter_3bit (
    input      clk,
    input      rst,    // active-high synchronous reset
    output [2:0] Q
);
    wire d0, d1, d2;

    // Next-state logic for down counter
    // rst overrides to load 111
    assign d0 = rst ? 1'b1 : ~Q[0];
    assign d1 = rst ? 1'b1 : (Q[1] ^ ~Q[0]);
    assign d2 = rst ? 1'b1 : (Q[2] ^ (~Q[1] & ~Q[0]));

    // Instantiate three positive-edge D flip-flops
    udp_dff FF0 (Q[0], clk, d0);
    udp_dff FF1 (Q[1], clk, d1);
    udp_dff FF2 (Q[2], clk, d2);

endmodule


// Testbench
module tb_down_counter_3bit;
    reg  clk, rst;
    wire [2:0] Q;

    down_counter_3bit DUT (.clk(clk), .rst(rst), .Q(Q));

    always #5 clk = ~clk;

    initial begin
        $display("=== 3-bit Down Counter Testbench ===");
        $display("Time | clk rst | Q[2:0] | Decimal");
        $display("-----|---------|--------|--------");

        clk = 0; rst = 1;
        @(posedge clk); #1;
        $display("%4t |  %b   %b  |  %b    |   %0d  (reset)", $time, clk, rst, Q, Q);

        rst = 0;
        repeat (10) begin
            @(posedge clk); #1;
            $display("%4t |  %b   %b  |  %b    |   %0d", $time, clk, rst, Q, Q);
        end

        $display("");
        $display("Expected sequence: 7->6->5->4->3->2->1->0->7->6->5->...");
        $finish;
    end
endmodule
