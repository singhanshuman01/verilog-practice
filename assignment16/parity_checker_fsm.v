`timescale 1ns/1ps



module parity_checker_3bit (
    input  clk,
    input  rst,
    input  in,           // serial input bits
    input  check,        // pulse high after 3rd bit to read result
    output parity_ok
);
    // States: track parity of bits seen
    parameter EVEN = 1'b0,   // even number of 1s
              ODD  = 1'b1;   // odd  number of 1s

    reg state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= EVEN;
        else
            state <= next_state;
    end

    // XOR-based toggle: each incoming '1' flips parity
    always @(*) begin
        if (in)
            next_state = ~state;   // flip parity
        else
            next_state = state;    // no change
    end

    // Output: parity is even (good) when in EVEN state
    assign parity_ok = (state == EVEN) && check;

endmodule


// ============================================================
// 4-bit Even Parity Checker FSM (same logic, extended)
// ============================================================
module parity_checker_4bit (
    input  clk,
    input  rst,
    input  in,
    input  check,
    output parity_ok
);
    parameter EVEN = 1'b0,
              ODD  = 1'b1;

    reg state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= EVEN;
        else
            state <= next_state;
    end

    always @(*) begin
        next_state = in ? ~state : state;
    end

    assign parity_ok = (state == EVEN) && check;

endmodule


// ============================================================
// Testbench for both parity checkers
// ============================================================
module parity_checker_tb;

    reg clk, rst, in, check;
    wire ok3, ok4;

    parity_checker_3bit p3 (.clk(clk),.rst(rst),.in(in),.check(check),.parity_ok(ok3));
    parity_checker_4bit p4 (.clk(clk),.rst(rst),.in(in),.check(check),.parity_ok(ok4));

    always #5 clk = ~clk;

    // Send a pattern and check parity after N bits
    task check_parity_3bit;
        input [2:0] bits;   // 3-bit value, MSB first
        integer i;
        begin
            rst=1; check=0; @(posedge clk); #1; rst=0;
            for (i=2; i>=0; i=i-1) begin
                in = bits[i];
                @(posedge clk); #1;
            end
            check = 1;
            @(posedge clk); #1;
            $display("  3-bit input=%03b | ones_count=%0d | parity_ok=%b (%s)",
                     bits,
                     bits[2]+bits[1]+bits[0],
                     ok3,
                     ok3 ? "EVEN-OK" : "ODD-ERR");
            check = 0;
        end
    endtask

    task check_parity_4bit;
        input [3:0] bits;
        integer i;
        begin
            rst=1; check=0; @(posedge clk); #1; rst=0;
            for (i=3; i>=0; i=i-1) begin
                in = bits[i];
                @(posedge clk); #1;
            end
            check = 1;
            @(posedge clk); #1;
            $display("  4-bit input=%04b | ones_count=%0d | parity_ok=%b (%s)",
                     bits,
                     bits[3]+bits[2]+bits[1]+bits[0],
                     ok4,
                     ok4 ? "EVEN-OK" : "ODD-ERR");
            check = 0;
        end
    endtask

    initial begin
        clk=0; rst=1; in=0; check=0; #12; rst=0;

        $display("==========================================================");
        $display("  FSM ASSIGNMENT 2: Even Parity Bit Checker");
        $display("==========================================================");

        $display("\n--- 3-bit Parity Checker ---");
        check_parity_3bit(3'b000);   // 0 ones → even → OK
        check_parity_3bit(3'b001);   // 1 one  → odd  → ERR
        check_parity_3bit(3'b011);   // 2 ones → even → OK
        check_parity_3bit(3'b111);   // 3 ones → odd  → ERR
        check_parity_3bit(3'b101);   // 2 ones → even → OK

        $display("\n--- 4-bit Parity Checker ---");
        check_parity_4bit(4'b0000);  // 0 ones → even → OK
        check_parity_4bit(4'b0001);  // 1 one  → odd  → ERR
        check_parity_4bit(4'b0011);  // 2 ones → even → OK
        check_parity_4bit(4'b0111);  // 3 ones → odd  → ERR
        check_parity_4bit(4'b1111);  // 4 ones → even → OK
        check_parity_4bit(4'b1010);  // 2 ones → even → OK

        $display("==========================================================");
        $finish;
    end

endmodule
