`define SQUARE(x) ((x) * (x))
`define CUBE(x) ((x) * (x) * (x))
`define IS_EVEN(x) (((x) % 2) == 0)
`define MAX3(a, b, c) (((a) > (b)) ? (((a) > (c)) ? (a) : (c)) : (((b) > (c)) ? (b) : (c)))
`define DELAY #10
`define SWAP(a, b) {a, b} = {b, a}

module basic_macros;
    integer out_sq, out_cb, val_a, val_b, val_c, large;
    reg [7:0] x, y;
    bit even;

    initial begin
        out_sq = `SQUARE(4);
        out_cb = `CUBE(3);
        even = `IS_EVEN(10);
        large = `MAX3(10, 25, 15);
        x = 8'hAA; y = 8'hBB;
        `DELAY;
        `SWAP(x, y);
    end
endmodule