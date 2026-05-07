`define WIDTH 8
`define CHECK_EQUAL
`define CHECK_GREATER

module comparator (
    input [(`WIDTH-1):0] A, B,
    output reg eq, gt, lt
);
    always @(*) begin
        eq = 1'b0; gt = 1'b0; lt = 1'b0;
        `ifdef CHECK_EQUAL
            if (A == B) eq = 1'b1;
        `endif
        `ifdef CHECK_GREATER
            if (A > B) gt = 1'b1;
        `endif
        `ifdef CHECK_LESS
            if (A < B) lt = 1'b1;
        `endif
    end
endmodule