module adder_4bit;
    task adder_4bit;
        input  [3:0] a, b;
        output [4:0] sum;   // 5-bit to capture carry
        begin
            sum = a + b;
        end
    endtask
endmodule