
`timescale 1ns/1ps

module parking_fsm (
    input        clk,
    input        rst,
    input  [1:0] coin,    // 00=none, 01=5, 10=10, 11=20
    output       gate     // 1 = gate opens
);

    parameter S0  = 3'd0,
              S5  = 3'd1,
              S10 = 3'd2,
              S15 = 3'd3,
              S20 = 3'd4;


    parameter COIN_NONE = 2'b00,
              COIN_5    = 2'b01,
              COIN_10   = 2'b10,
              COIN_20   = 2'b11;

    reg [2:0] state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end

    always @(*) begin
        next_state = state;

        case (state)
            S0: begin
                case (coin)
                    COIN_5:  next_state = S5;
                    COIN_10: next_state = S10;
                    COIN_20: next_state = S20;
                    default: next_state = S0;
                endcase
            end
            S5: begin
                case (coin)
                    COIN_5:  next_state = S10;
                    COIN_10: next_state = S15;
                    COIN_20: next_state = S20;
                    default: next_state = S5;
                endcase
            end
            S10: begin
                case (coin)
                    COIN_5:  next_state = S15;
                    COIN_10: next_state = S20;
                    COIN_20: next_state = S20;
                    default: next_state = S10;
                endcase
            end
            S15: begin
                case (coin)
                    COIN_5:  next_state = S20;
                    COIN_10: next_state = S20;
                    COIN_20: next_state = S20;
                    default: next_state = S15;
                endcase
            end
            S20: begin
                next_state = S20;
            end
            default: next_state = S0;
        endcase
    end

    assign gate = (state == S20);

endmodule



module parking_fsm_tb;

    reg        clk, rst;
    reg  [1:0] coin;
    wire       gate;

    parking_fsm dut (.clk(clk), .rst(rst), .coin(coin), .gate(gate));

    always #5 clk = ~clk;

    task insert;
        input [1:0] c;
        input [4:0] amount;
        begin
            coin = c;
            @(posedge clk); #1;
            coin = 2'b00;
            $display("  Inserted Rs.%2d | gate=%b %s",
                     amount, gate, gate ? "<< GATE OPEN >>" : "");
        end
    endtask

    initial begin
        clk=0; rst=1; coin=0; #12; rst=0;

        $display("==========================================================");
        $display("  FSM ASSIGNMENT 3: Parking Payment System");
        $display("  Target: Rs.20 | Coins: 5, 10, 20");
        $display("==========================================================");

        $display("\n--- Test 1: 5+5+5+5 = 20 ---");
        insert(2'b01, 5);
        insert(2'b01, 5);
        insert(2'b01, 5);
        insert(2'b01, 5);   // gate should open

        rst=1; #12; rst=0;

        $display("\n--- Test 2: 10+10 = 20 ---");
        insert(2'b10, 10);
        insert(2'b10, 10);  // gate should open

        rst=1; #12; rst=0;

        $display("\n--- Test 3: single 20 coin ---");
        insert(2'b11, 20);  // gate should open immediately

        rst=1; #12; rst=0;

        $display("\n--- Test 4: 5+10+5 = 20 ---");
        insert(2'b01, 5);
        insert(2'b10, 10);
        insert(2'b01, 5);   // gate should open

        $display("==========================================================");
        $finish;
    end

endmodule
