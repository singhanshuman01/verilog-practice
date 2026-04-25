`timescale 1ns / 1ps

module tb_sr_latch;

    // Inputs
    reg sn;
    reg rn;

    // Outputs
    wire q;
    wire qn;

    sr_latch uut (
        .sn(sn), 
        .rn(rn), 
        .q(q), 
        .qn(qn)
    );

    initial begin
        // Monitor changes
        $monitor("Time=%0t | Set_n=%b Reset_n=%b | Q=%b Qn=%b", $time, sn, rn, q, qn);

        // 1. Set the latch (sn=0, rn=1)
        sn = 0; rn = 1; #10;
        
        // 2. Hold state (sn=1, rn=1)
        sn = 1; rn = 1; #10;
        
        // 3. Reset the latch (sn=1, rn=0)
        sn = 1; rn = 0; #10;
        
        // 4. Hold state (sn=1, rn=1)
        sn = 1; rn = 1; #10;

        // 5. Invalid State (sn=0, rn=0)
        sn = 0; rn = 0; #10;

        $finish;
    end

    initial begin
        $dumpfile("sr_latch.vcd");
        $dumpvars;
    end
      
endmodule