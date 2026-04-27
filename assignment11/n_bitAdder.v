module full_adder (
    input a, b, cin,
    output sum, cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

module n_bit_adder #(parameter WIDTH = 4) (
    input [(WIDTH-1):0] A,
    input [(WIDTH-1):0] B,
    input cin,
    output [(WIDTH-1):0] sum,
    output cout
);

    wire [WIDTH:0] carry;
    assign carry[0] = cin;
    assign cout = carry[WIDTH];

    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : adder_loop
            full_adder fa_inst (
                .a(A[i]),
                .b(B[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate

endmodule