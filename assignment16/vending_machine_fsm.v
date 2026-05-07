`timescale 1ns/1ps

module vending_machine_fsm (
    input        clk,
    input        rst,
    input  [2:0] coin,
    output reg   dispense   
);

    parameter S0  = 4'd0,
              S1  = 4'd1,
              S2  = 4'd2,
              S3  = 4'd3,
              S4  = 4'd4,
              S5  = 4'd5,
              S6  = 4'd6,
              S7  = 4'd7,
              S8  = 4'd8,
              S9  = 4'd9,
              S10 = 4'd10;

    reg [3:0] state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end


    always @(*) begin
        next_state = state;

        if (state < S10) begin
            case (coin)
                3'd1: next_state = (state + 1  >= 10) ? S10 : state + 1;
                3'd2: next_state = (state + 2  >= 10) ? S10 : state + 2;
                3'd5: next_state = (state + 5  >= 10) ? S10 : state + 5;
                default: next_state = state;
            endcase
        end else begin
            
            next_state = S0;
        end
    end


    always @(*) begin
        dispense = (state == S10);
    end

endmodule


module vending_machine_fsm_tb;

    reg        clk, rst;
    reg  [2:0] coin;
    wire       dispense;

    vending_machine_fsm dut (.clk(clk), .rst(rst), .coin(coin), .dispense(dispense));

    always #5 clk = ~clk;

    task insert;
        input [2:0] c;
        begin
            coin = c;
            @(posedge clk); #1;
            coin = 3'd0;
            $display("  Inserted Rs.%0d | dispense=%b %s",
                     c, dispense, dispense ? "<< ITEM DISPENSED! >>" : "");
        end
    endtask

    initial begin
        clk=0; rst=1; coin=0; #12; rst=0;


        $display("\n--- Test 1: 5 + 5 = 10 ---");
        insert(3'd5);
        insert(3'd5);   

        #15; 

        $display("\n--- Test 2: 1+1+1+1+1+5 = 10 ---");
        insert(3'd1);
        insert(3'd1);
        insert(3'd1);
        insert(3'd1);
        insert(3'd1);
        insert(3'd5);

        #15;

        $display("\n--- Test 3: 2+2+2+2+2 = 10 ---");
        insert(3'd2);
        insert(3'd2);
        insert(3'd2);
        insert(3'd2);
        insert(3'd2);

        #15;

        $display("\n--- Test 4: 5+2+1+2 = 10 ---");
        insert(3'd5);
        insert(3'd2);
        insert(3'd1);
        insert(3'd2);

        $finish;
    end

endmodule
