`timescale 1ns/1ps

module gray_code_fsm (
    input        clk,
    input        rst,
    output [2:0] gray_out
);

    parameter G000 = 3'b000,
              G001 = 3'b001,
              G011 = 3'b011,
              G010 = 3'b010,
              G110 = 3'b110,
              G111 = 3'b111,
              G101 = 3'b101,
              G100 = 3'b100;

    reg [2:0] state, next_state;


    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= G000;
        else
            state <= next_state;
    end


    always @(*) begin
        case (state)
            G000: next_state = G001;
            G001: next_state = G011;
            G011: next_state = G010;
            G010: next_state = G110;
            G110: next_state = G111;
            G111: next_state = G101;
            G101: next_state = G100;
            G100: next_state = G000;
            default: next_state = G000;
        endcase
    end

    assign gray_out = state;

endmodule



module gray_code_fsm_tb;

    reg  clk, rst;
    wire [2:0] gray_out;

    gray_code_fsm dut (.clk(clk), .rst(rst), .gray_out(gray_out));

    always #5 clk = ~clk;

    function [2:0] gray_to_bin;
        input [2:0] g;
        begin
            gray_to_bin[2] = g[2];
            gray_to_bin[1] = g[2] ^ g[1];
            gray_to_bin[0] = g[2] ^ g[1] ^ g[0];
        end
    endfunction

    integer i;

    initial begin
        clk=0; rst=1; #12; rst=0;

        $display("==========================================================");
        $display("  FSM ASSIGNMENT 1: 3-bit Gray Code Generator");
        $display("  Cycle | Gray Output | Binary Equivalent");
        $display("==========================================================");

        for (i = 0; i < 16; i = i + 1) begin
            @(posedge clk); #1;
            $display("  %4d  |    %03b      |      %0d",
                     i, gray_out, gray_to_bin(gray_out));
        end

        $display("==========================================================");
        $finish;
    end

endmodule
