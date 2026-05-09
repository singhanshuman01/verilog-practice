`timescale 1ns/1ps

module divider_fsmd (
    input clk,
    input reset,
    input start,
    input [7:0] dividend,
    input [7:0] divisor,
    output reg done,
    output reg [7:0] quotient,
    output reg [7:0] remainder
);

//=========== STATE ENCODING ===========//
parameter IDLE  = 3'd0,
          LOAD  = 3'd1,
          SHIFT = 3'd2,
          SUB   = 3'd3,
          CHECK = 3'd4,
          DONE  = 3'd5;

reg [2:0] state, next_state;

//=========== DATAPATH ===========//
reg [15:0] A;     // {remainder, quotient}
reg [7:0] M;      // divisor
reg [3:0] count;  // iteration counter

//=========== STATE REGISTER ===========//
always @(posedge clk or posedge reset) begin
    if (reset)
        state <= IDLE;
    else
        state <= next_state;
end

//=========== NEXT STATE LOGIC ===========//
always @(*) begin
    case (state)
        IDLE:   next_state = start ? LOAD : IDLE;
        LOAD:   next_state = SHIFT;
        SHIFT:  next_state = SUB;
        SUB:    next_state = CHECK;
        CHECK:  next_state = (count == 0) ? DONE : SHIFT;
        DONE:   next_state = IDLE;
        default: next_state = IDLE;
    endcase
end

//=========== DATAPATH OPERATIONS ===========//
always @(posedge clk or posedge reset) begin
    if (reset) begin
        A <= 0;
        M <= 0;
        count <= 0;
        quotient <= 0;
        remainder <= 0;
        done <= 0;
    end
    else begin
        case (state)

            IDLE: begin
                done <= 0;
            end

            LOAD: begin
                A <= {8'b0, dividend};
                M <= divisor;
                count <= 8;
            end

            SHIFT: begin
                A <= A << 1;
            end

            SUB: begin
                A[15:8] <= A[15:8] - M;
            end

            CHECK: begin
                if (A[15] == 1) begin
                    A[15:8] <= A[15:8] + M; // restore
                    A[0] <= 0;
                end else begin
                    A[0] <= 1;
                end
                count <= count - 1;
            end

            DONE: begin
                quotient <= A[7:0];
                remainder <= A[15:8];
                done <= 1;
            end

        endcase
    end
end

endmodule


//================ TESTBENCH =================//

module tb_divider;

reg clk;
reg reset;
reg start;
reg [7:0] dividend;
reg [7:0] divisor;

wire done;
wire [7:0] quotient;
wire [7:0] remainder;

// Instantiate DUT
divider_fsmd dut (
    .clk(clk),
    .reset(reset),
    .start(start),
    .dividend(dividend),
    .divisor(divisor),
    .done(done),
    .quotient(quotient),
    .remainder(remainder)
);

// Clock
always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    start = 0;

    #10 reset = 0;

    // Test 1
    #10;
    dividend = 25;
    divisor = 4;
    start = 1;
    #10 start = 0;

    wait(done);
    $display("25 / 4 = Q:%d R:%d", quotient, remainder);

    // Test 2
    #20;
    dividend = 100;
    divisor = 7;
    start = 1;
    #10 start = 0;

    wait(done);
    $display("100 / 7 = Q:%d R:%d", quotient, remainder);

    // Test 3
    #20;
    dividend = 15;
    divisor = 3;
    start = 1;
    #10 start = 0;

    wait(done);
    $display("15 / 3 = Q:%d R:%d", quotient, remainder);

    #50 $finish;
end

endmodule