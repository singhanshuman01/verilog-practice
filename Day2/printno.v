module printnumber;

int a;

initial begin

    for(a = 0; a<=10; a+=1)begin
        $display("no. is %0d",a);
    end
end
endmodule