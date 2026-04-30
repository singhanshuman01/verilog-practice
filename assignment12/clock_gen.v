module clock_gen;
    reg clk;
 
    task generate_clock;
        input  integer half_period;   // half-period in ns
        input  integer num_cycles;
        integer i;
        begin
            clk = 0;
            $display("\n--- Clock Generation (period = %0d ns, cycles = %0d) ---",
                     half_period * 2, num_cycles);
            for (i = 0; i < num_cycles * 2; i = i + 1) begin
                #(half_period) clk = ~clk;
                $display("  Time=%0t ns | CLK = %b", $time, clk);
            end
        end
    endtask
endmodule