`define OP_ADD

module arithmetic_unit (
    input [7:0] a, b,
    output reg [8:0] result
);
    always @(*) begin
        `ifdef OP_ADD
            result = a + b;
        `elsif OP_SUB
            result = a - b;
        `elsif OP_INC
            result = a + 1;
        `endif
    end
endmodule