module inv( output y, input a);

assign #2 y = ~a;
endmodule

module tb_inv;
reg a;
wire y;

inv i1(y,a);

initial begin
    $monitor("y =%b , a = %b",y,a);

    #10 a = 1;
    #10 a = 0;
    #5  a = 1;
    #100 $finish;
 
end

initial begin
    $dumpfile("invv.vcd");
    $dumpvars;
end

endmodule