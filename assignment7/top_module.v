`timescale 1ns/1ps

module top_module (
    input clk,    // Clocks are used in sequential circuits
    input d,
    output reg q );//
    
    // Use a clocked always block
    always @(posedge clk) begin
        q <= d;
    end
    //   copy d to q at every positive edge of clk
    //   Clocked always blocks should use non-blocking assignments

endmodule

module tb;
    reg clock;
    reg d;
    wire q;

    top_module dff1 (
        .clk(clock),
        .d  (d),
        .q  (q)
    );
    initial clock = 1'b0;
    always #5 clock = ~clock;

/*
    always begin
        #12 d = 1;
        #8 d = 0;
    end
    */
    initial begin
        d=0;

        $monitor("Time=%0t | d = %0b | q = %0b\n", $time, d, q);
        #12 d = 1;
        #8 d = 0;
        #15 d = 1;


        #500 $finish;

    end

    initial begin
        $dumpfile("dff.vcd");
        $dumpvars;
    end
endmodule