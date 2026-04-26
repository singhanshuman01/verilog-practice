module mux21 (
    a,s,y
);
input [1:0] a;
input s;
output reg y;

initial begin

if(s==0)begin
     y = a[0];
end else begin y = a[1];
end
end

    
endmodule
