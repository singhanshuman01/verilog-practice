`define WIDTH 4
`define ENCODING_BINARY

module priority_encoder (
    input [(`WIDTH-1):0] in,
    output reg [3:0] out
);
    always @(*) begin
        `ifdef ENCODING_BINARY
            if (in[3]) out = 2'b11;
            else if (in[2]) out = 2'b10;
            else if (in[1]) out = 2'b01;
            else out = 2'b00;
        `elsif ENCODING_ONEHOT
            if (in[3]) out = 4'b1000;
            else if (in[2]) out = 4'b0100;
            else if (in[1]) out = 4'b0010;
            else out = 4'b0001;
        `endif
    end
endmodule