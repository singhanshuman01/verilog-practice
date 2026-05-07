`timescale 1ns/1ps 
module faaa (output sum,cout, input a, b ,cin);
wire t,g,h;

assign #2 t = a^b;
assign #2 sum = t^cin;
assign #4 g = a&b;
assign #4 h = t&cin;
assign #2 cout = g|h;
    
endmodule

module tb_f;
    reg a,b,cin;
    wire sum,cout;

    faaa f1(sum,cout,a,b,cin);

    initial begin
        a = 1'b0;
        b = 1'b0;
        cin = 1'b0;
        $monitor("a=%0b, b=%0b, cin=%0b, sum = %0b, cout = %0b",a,b,cin,sum,cout);
        #5 a = 1;
        #10 b = 1;
        #15 cin = 1;
        #20 a = 0;

        $dumpfile("faaa.vcd");
        $dumpvars;
        #1000 $finish;
    end
endmodule