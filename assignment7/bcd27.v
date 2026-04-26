module bcd27(
    input [3:0] bcd,
    output reg [6:0] seg
);

always @(*) begin
    if (bcd == 4'd0) seg = 7'b1111110;
    else if (bcd == 4'd1) seg = 7'b0110000;
    else if (bcd == 4'd2) seg = 7'b1101101;
    else if (bcd == 4'd3) seg = 7'b1111001;
    else if (bcd == 4'd4) seg = 7'b0110011;
    else if (bcd == 4'd5) seg = 7'b1011011;
    else if (bcd == 4'd6) seg = 7'b1011111;
    else if (bcd == 4'd7) seg = 7'b1110000;
    else if (bcd == 4'd8) seg = 7'b1111111;
    else if (bcd == 4'd9) seg = 7'b1111011;
    else seg = 7'b0000000;
end

endmodule

`timescale 1ns/1ps

module bcd_to_7seg_tb;

reg [3:0] bcd;
wire [6:0] seg;

// Instantiate DUT
bcd_to_7seg uut (
    .bcd(bcd),
    .seg(seg)
);

initial begin
    // Dump waveform
    $dumpfile("bcd_7seg.vcd");
    $dumpvars(0, bcd_to_7seg_tb);

    // Test all inputs 0–15
    bcd = 0;
    repeat (16) begin
        #10 bcd = bcd + 1;
    end

    #20 $finish;
end

endmodule
