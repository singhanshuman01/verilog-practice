module multi_task;
    task multiply_8bit;
        input  [7:0] a, b;
        output [15:0] product;
        begin
            product = a * b;
        end
    endtask
endmodule