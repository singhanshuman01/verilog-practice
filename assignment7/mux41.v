module mux21 (
    a,s,y
);
input [3:0] a;
input [1:0]s;
output reg y;

initial begin

if(s[1]==0 && s[0]==0)begin
     y = a[0];
end else if (s[1]==0 && s[0]==1) begin y = a[1];
end else if (s[1]==1 && s[0]==0) begin y = a[2];
end else if (s[1]==1 && s[0]==1) begin y = a[3];
end
end

    
endmodule