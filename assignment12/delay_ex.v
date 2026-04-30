module delay_ex;
    reg [3:0] dut_in;
    reg       dut_en;
 
    task apply_test_vectors;
        input integer delay_ns;
        reg [3:0] vectors [0:7];
        integer i;
        begin
            // Define test vectors
            vectors[0] = 4'b0000;
            vectors[1] = 4'b0001;
            vectors[2] = 4'b0011;
            vectors[3] = 4'b0111;
            vectors[4] = 4'b1111;
            vectors[5] = 4'b1010;
            vectors[6] = 4'b0101;
            vectors[7] = 4'b1100;
 
            $display("\n--- Applying Test Vectors (delay=%0d ns between each) ---", delay_ns);
            dut_en = 1;
            for (i = 0; i < 8; i = i + 1) begin
                dut_in = vectors[i];
                $display("  Time=%0t | Vector[%0d] = 4'b%04b", $time, i, dut_in);
                #(delay_ns);
            end
            dut_en = 0;
        end
    endtask
endmodule