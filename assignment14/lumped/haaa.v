module haaa (output sum, cout ,input a,b);
    assign #5 sum = a^b;
    assign #10 cout = a&b;
endmodule

module tb_ha;
reg a,b;
wire sum,cout;
haaa h1(sum,cout,a,b);

initial begin
    a=1'b0;
    b=1'b0;
    $monitor("@%0t a = %0b, b = %0b,sum = %0b, cout = %0b",$time,a,b,sum,cout);
    #5 a = 1;
    #10 b = 1;
    $dumpfile("haaa.vcd");
    $dumpvars;
    #100 $finish;
end


endmodule