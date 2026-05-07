
`timescale 1ns/1ps

module moore_1011 (
    input  clk, rst, in,
    output out
);
    parameter S0=3'd0, S1=3'd1, S2=3'd2, S3=3'd3, S4=3'd4;
    reg [2:0] state, next_state;

    always @(posedge clk or posedge rst)
        state <= rst ? S0 : next_state;

    always @(*) begin
        next_state = S0;
        case (state)
            S0: next_state = in ? S1 : S0;
            S1: next_state = in ? S1 : S2;
            S2: next_state = in ? S3 : S0;
            S3: next_state = in ? S4 : S2;
            S4: next_state = in ? S1 : S2;
        endcase
    end

    assign out = (state == S4);

endmodule




module moore_110 (
    input  clk, rst, in,
    output out
);
    parameter S0=2'd0, S1=2'd1, S2=2'd2, S3=2'd3;
    reg [1:0] state, next_state;

    always @(posedge clk or posedge rst)
        state <= rst ? S0 : next_state;

    always @(*) begin
        next_state = S0;
        case (state)
            S0: next_state = in ? S1 : S0;
            S1: next_state = in ? S2 : S0;
            S2: next_state = in ? S2 : S3;
            S3: next_state = in ? S2 : S0;  // overlap: on 1 back to S2
        endcase
    end

    assign out = (state == S3);

endmodule



module moore_alternating (
    input  clk, rst, in,
    output out
);
    parameter S0=2'd0, S1=2'd1, S2=2'd2;
    reg [1:0] state, next_state;

    always @(posedge clk or posedge rst)
        state <= rst ? S0 : next_state;

    always @(*) begin
        next_state = S0;
        case (state)
            S0: next_state = in ? S1 : S0;
            S1: next_state = in ? S0 : S2;
            S2: next_state = in ? S1 : S0;
        endcase
    end


    assign out = (state == S1) || (state == S2);

endmodule


module moore_1001 (
    input  clk, rst, in,
    output out
);
    parameter S0=3'd0, S1=3'd1, S2=3'd2, S3=3'd3, S4=3'd4;
    reg [2:0] state, next_state;

    always @(posedge clk or posedge rst)
        state <= rst ? S0 : next_state;

    always @(*) begin
        next_state = S0;
        case (state)
            S0: next_state = in ? S1 : S0;
            S1: next_state = in ? S1 : S2;
            S2: next_state = in ? S1 : S3;
            S3: next_state = in ? S4 : S0;
            S4: next_state = in ? S1 : S2;
        endcase
    end

    assign out = (state == S4);

endmodule




module moore_three1s (
    input  clk, rst, in,
    output out
);
    parameter S0=2'd0, S1=2'd1, S2=2'd2, S3=2'd3;
    reg [1:0] state, next_state;

    always @(posedge clk or posedge rst)
        state <= rst ? S0 : next_state;

    always @(*) begin
        next_state = S0;
        case (state)
            S0: next_state = in ? S1 : S0;
            S1: next_state = in ? S2 : S0;
            S2: next_state = in ? S3 : S0;
            S3: next_state = in ? S3 : S0;
        endcase
    end

    assign out = (state == S3);

endmodule




module moore_0110 (
    input  clk, rst, in,
    output out
);
    parameter S0=3'd0, S1=3'd1, S2=3'd2, S3=3'd3, S4=3'd4;
    reg [2:0] state, next_state;

    always @(posedge clk or posedge rst)
        state <= rst ? S0 : next_state;

    always @(*) begin
        next_state = S0;
        case (state)
            S0: next_state = in ? S1 : S0;
            S1: next_state = in ? S0 : S2;
            S2: next_state = in ? S3 : S0;
            S3: next_state = in ? S4 : S0;
            S4: next_state = in ? S1 : S0;
        endcase
    end

    assign out = (state == S4);

endmodule




module moore_001 (
    input  clk, rst, in,
    output out
);
    parameter S0=2'd0, S1=2'd1, S2=2'd2, S3=2'd3;
    reg [1:0] state, next_state;

    always @(posedge clk or posedge rst)
        state <= rst ? S0 : next_state;

    always @(*) begin
        next_state = S0;
        case (state)
            S0: next_state = in ? S0 : S1;
            S1: next_state = in ? S0 : S2;
            S2: next_state = in ? S3 : S2;
            S3: next_state = in ? S0 : S1;
        endcase
    end

    assign out = (state == S3);

endmodule




module moore_palindrome (
    input  clk, rst, in,
    output out
);
    parameter S0=3'd0, S1=3'd1, S2=3'd2, S3=3'd3, S4=3'd4;
    reg [2:0] state, next_state;

    always @(posedge clk or posedge rst)
        state <= rst ? S0 : next_state;

    always @(*) begin
        next_state = S0;
        case (state)
            S0: next_state = in ? S1 : S0;
            S1: next_state = in ? S1 : S2;
            S2: next_state = in ? S2 : S3;
            S3: next_state = in ? S4 : S0;
            S4: next_state = in ? S1 : S1;
        endcase
    end

    assign out = (state == S4);

endmodule



module moore_fsms_tb;

    reg clk, rst, in;

    wire m1_out, m2_out, m3_out, m4_out;
    wire m5_out, m6_out, m7_out, m8_out;

    moore_1011        m1 (.clk(clk),.rst(rst),.in(in),.out(m1_out));
    moore_110         m2 (.clk(clk),.rst(rst),.in(in),.out(m2_out));
    moore_alternating m3 (.clk(clk),.rst(rst),.in(in),.out(m3_out));
    moore_1001        m4 (.clk(clk),.rst(rst),.in(in),.out(m4_out));
    moore_three1s     m5 (.clk(clk),.rst(rst),.in(in),.out(m5_out));
    moore_0110        m6 (.clk(clk),.rst(rst),.in(in),.out(m6_out));
    moore_001         m7 (.clk(clk),.rst(rst),.in(in),.out(m7_out));
    moore_palindrome  m8 (.clk(clk),.rst(rst),.in(in),.out(m8_out));

    always #5 clk = ~clk;

    // ---- helper task ----
    task send;
        input b;
        begin
            in = b;
            @(posedge clk); #1;
        end
    endtask

    task run_stream;
        input [31:0] stream;
        
        input [4:0]  len;
        integer i;
        begin
            for (i = len-1; i >= 0; i = i - 1) begin
                in = stream[i];
                @(posedge clk); #1;
                $display("  in=%b | 1011:%b 110:%b alt:%b 1001:%b 3x1:%b 0110:%b 001:%b pal:%b",
                    in, m1_out,m2_out,m3_out,m4_out,m5_out,m6_out,m7_out,m8_out);
            end
        end
    endtask

    initial begin
        clk=0; rst=1; in=0; #12; rst=0;

        $display("==========================================================");
        $display("  MOORE FSMs — All 8 sequence detectors");
        $display("  Columns: in | 1011 | 110 | alt | 1001 | 3x1 | 0110 | 001 | pal");
        $display("==========================================================");


        $display("\n[FSM1] Expecting 1011 detection:");
        send(1);send(0);send(1);send(1); 
        send(0);send(1);send(1);

        rst=1; #12; rst=0;


        $display("\n[FSM2] Expecting 110 detection:");
        send(1);send(1);send(0); 
        send(1);send(1);send(0); 

        rst=1; #12; rst=0;


        $display("\n[FSM5] Expecting three-1s detection:");
        send(1);send(1);send(1); 
        send(0);send(1);send(1);send(1); 

        rst=1; #12; rst=0;


        $display("\n[FSM7] Expecting 001 detection:");
        send(0);send(0);send(1); 
        send(0);send(0);send(1); 

        rst=1; #12; rst=0;


        $display("\n[FSM8] Expecting 1001 palindrome detection:");
        send(1);send(0);send(0);send(1); 
        send(1);send(0);send(0);send(1); 

        $display("\n==========================================================");
        $display("  ALL MOORE FSMs DONE");
        $display("==========================================================");
        $finish;
    end

endmodule
