module parity_cal;
    task parity_calc;
        input  [7:0] data;
        output even_parity;   // 1 = even parity, 0 = odd parity
        output odd_parity;
        begin
            even_parity = ~^data;   // XOR reduction; invert for even parity bit
            odd_parity  =  ^data;   // parity bit that makes total odd
            $display("\n--- Parity Calculation for 8'b%08b (%0d) ---", data, data);
            $display("  Even parity bit : %b", even_parity);
            $display("  Odd  parity bit : %b", odd_parity);
        end
    endtask
endmodule