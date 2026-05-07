`define N 4
`define GATE_TYPE_XOR

module logic_block (
    input [(`N-1):0] a, b,
    output reg [(`N-1):0] out
);
    always @(*) begin
        `ifdef GATE_TYPE_AND
            out = a & b;
        `elsif GATE_TYPE_OR
            out = a | b;
        `elsif GATE_TYPE_XOR
            out = a ^ b;
        `endif
    end
endmodule