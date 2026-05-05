`timescale 1ns/10ps

module bcd_addertb;
reg [3:0] x, y;
reg cin;
wire [3:0] s;
wire cout;

BCD_add bcd1(
    .S(s),
    .A(x),
    .B(y),
    .Carryout(cout)
);
integer i,j;

initial begin
    $monitor("Time=%0t | A=%d B=%d | Sum=%d Carry=%b\n", $time, x,y,s,cout);

    x=0; y=0; cin=0;
    #10;
    for (i =0 ;i<10 ;i=i+1 ) begin
        for (j =0 ; j<10 ;j=j+1 ) begin
            x=i;
            y=j;
            #10;
        end
    end
    x=4'b1010; y=4'b0101; #10;
    x=4'b1111; y=4'b1111; #10;

    $finish;
end

endmodule