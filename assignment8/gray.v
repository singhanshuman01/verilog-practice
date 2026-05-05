module gray_counter (
    input clk,
    input rst,
    output reg [3:0] q
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        q <= 4'b0000;
    end else begin
        case (q)
            4'b0000: q <= 4'b0001;
            4'b0001: q <= 4'b0011;
            4'b0011: q <= 4'b0010;
            4'b0010: q <= 4'b0110;
            4'b0110: q <= 4'b0111;
            4'b0111: q <= 4'b0101;
            4'b0101: q <= 4'b0100;
            4'b0100: q <= 4'b1100;
            4'b1100: q <= 4'b1101;
            4'b1101: q <= 4'b1111;
            4'b1111: q <= 4'b1110;
            4'b1110: q <= 4'b1010;
            4'b1010: q <= 4'b1011;
            4'b1011: q <= 4'b1001;
            4'b1001: q <= 4'b1000;
            4'b1000: q <= 4'b0000; // count completion → reset
            default: q <= 4'b0000;
        endcase
    end
end

endmodule

`timescale 1ns/1ps

module gray_counter_tb;

reg clk;
reg rst;
wire [3:0] q;

// Instantiate DUT (Device Under Test)
gray_counter uut (
    .clk(clk),
    .rst(rst),
    .q(q)
);

// Clock generation (10 ns period)
always #5 clk = ~clk;

initial begin
    // Initialize
    clk = 0;
    rst = 1;

    // Dump file setup
    $dumpfile("gray.vcd");
    $dumpvars(0, gray_counter_tb);

    // Apply reset
    #10 rst = 0;

    // Let counter run for a while
    #200;

    // Apply reset again to check behavior
    rst = 1;
    #10 rst = 0;

    #100;

    $finish;
end

endmodule