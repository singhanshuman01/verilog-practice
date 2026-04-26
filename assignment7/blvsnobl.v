module blvsnobl;

reg[7:0] x1,x2,x3,y1,y2;
initial begin
    x1<=8'h10;
    $display("[%0t] x1=0x%0h x2=0x%0h x3=0x%0h\n", $time, x1,x2,x3);
    x2<=8'h20;
    $display("[%0t] x1=0x%0h x2=0x%0h x3=0x%0h\n", $time, x1,x2,x3);
    x3<=8'h30;
    $display("[%0t] x1=0x%0h x2=0x%0h x3=0x%0h\n", $time, x1,x2,x3);
    // $display("[%0t] x1=0x%0h x2=0x%0h x3=0x%0h\n", $time, x1,x2,x3);

end

initial begin
    y1<=8'h40;
    $display("[%0t] y1=0x%0h y2=0x%0h\n", $time, y1,y2);
    y1<=8'h50;
    $display("[%0t] y1=0x%0h y2=0x%0h\n", $time, y1,y2);
end


endmodule