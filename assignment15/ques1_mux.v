`define MUX_4_1
`define DATA_WIDTH 8

module parameterized_mux (
    input [(`DATA_WIDTH-1):0] in0, in1, in2, in3,
    input [2:0] sel,
    output reg [(`DATA_WIDTH-1):0] out
);
    always @(*) begin
        `ifdef MUX_2_1
            case(sel[0])
                1'b0: out = in0;
                1'b1: out = in1;
            endcase
        `elsif MUX_4_1
            case(sel[1:0])
                2'b00: out = in0;
                2'b01: out = in1;
                2'b10: out = in2;
                2'b11: out = in3;
            endcase
        `endif
    end
endmodule