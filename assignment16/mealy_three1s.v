
`timescale 1ns/1ps

module mealy_three1s (
    input  clk,
    input  rst,
    input  in,
    output reg out
);
    parameter S0 = 2'b00,
              S1 = 2'b01,
              S2 = 2'b10;

    reg [1:0] state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end

    always @(*) begin
        next_state = S0;
        out        = 0;

        case (state)
            S0: begin
                if (in) begin next_state = S1; out = 0; end
                else    begin next_state = S0; out = 0; end
            end
            S1: begin
                if (in) begin next_state = S2; out = 0; end
                else    begin next_state = S0; out = 0; end
            end
            S2: begin
                if (in) begin next_state = S0; out = 1; end
                else    begin next_state = S0; out = 0; end
            end
        endcase
    end

endmodule


module mealy_three1s_tb;

    reg  clk, rst, in;
    wire out;

    mealy_three1s dut (.clk(clk), .rst(rst), .in(in), .out(out));

    always #5 clk = ~clk;

    task send_bit;
        input b;
        begin
            in = b;
            @(posedge clk); #1;
            $display("  Time=%0t | in=%b | out=%b", $time, in, out);
        end
    endtask

    initial begin
        clk = 0; rst = 1; in = 0;
        #12; rst = 0;


        send_bit(1);
        send_bit(1);
        send_bit(1);  // expect out=1
        send_bit(0);
        send_bit(1);
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(1);
        send_bit(1);  // expect out=1

        $finish;
    end

endmodule
