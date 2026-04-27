module ev_parity(
output y,
input [7:0]a);

wire [7:0] w;
genvar i;
assign w[0] = a[0];

generate
    for (i = 0; i<7 ;i=i+1 ) begin: parcheck
        assign w[i+1] = ~(w[i]^a[i+1]);
    end
endgenerate
assign y = w[7];
endmodule

/*
module tb;
    reg [7:0] a;
    wire y;

initial begin
    a = 0;
    #600 $finish;
end
    ev_parity ev1 (
        .y(y),
        .a(a)
    );

    always @(*) begin
        #2 a = a+1'b1;
    end

    initial begin
        $dumpfile("ev_parity.vcd");
        $dumpvars;
    end
endmodule*/