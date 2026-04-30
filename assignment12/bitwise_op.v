module bitwise_op;
    task bitwise_ops;
        input  [3:0] a, b;
        output [3:0] and_out, or_out, xor_out, not_a;
        begin
            and_out = a & b;
            or_out  = a | b;
            xor_out = a ^ b;
            not_a   = ~a;
            $display("\n--- Bitwise Operations: A=4'b%04b  B=4'b%04b ---", a, b);
            $display("  AND : %04b", and_out);
            $display("  OR  : %04b", or_out);
            $display("  XOR : %04b", xor_out);
            $display("  NOT A: %04b", not_a);
        end
    endtask
endmodule