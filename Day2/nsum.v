module print_10_number;

int a, sum = 0;

initial begin
for(a=0;a<11;a=a+1) begin
    sum+=a;
end
$display("sum of n no. %0d",sum);
end
endmodule
