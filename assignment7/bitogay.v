module bitogay (
    output reg [3:0]y,
    input [3:0]a
);

always @(*) begin
case (a[3:0])
     a[3] : (y[3] = a[3]);
     a[2] : (y[2] = a[3]^a[2]);
     a[1] : (y[1] = a[2]^a[1]);
     a[0] : (y[0] = a[1]^a[0]);
endcase    
end
    
endmodule