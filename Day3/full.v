module full(sum, c_out, a, b, e, c_in);
output [4:0]sum;
output c_out;
input [3:0]a;
input [3:0]b;
input [3:0]e;
input c_in;

wire [3:0]p;
wire [3:0]g;
wire [3:0]q;
wire [3:0]h;
wire [3:0]y;
wire [3:0]z;
wire [3:0]c;

assign p[0] = a[0]^b[0],
       p[1] = a[1]^b[1],
       p[2] = a[2]^b[2],
       p[3] = a[3]^b[3];
       
assign g[0] = a[0]&b[0],
       g[1] = a[1]&b[1],
       g[2] = a[2]&b[2],
       g[3] = a[3]&b[3];
       

assign z[3:0] = {g[3:0] | (p[3:0]&e[3:0])};
assign y[2:0] = {p[3:1] ^ e[3:1]}; 

assign q[2:0] = {z[2:0] ^ y[2:0]};
assign q[3] = z[3]^y[3];
assign h[3:0] = z[3:0]&y[3:0];
              
assign c[0] = q[0] | (z[0]&c_in);
assign c[1] = q[1] | (z[1]&c[0]);
assign c[2] = q[2] | (z[2]&c[1]);
assign c[3] = q[3] | (z[3]&c[2]);

assign sum [0] = p[0]^e[0],
       sum [1] = q[0]^c[0],
       sum [2] = q[1]^c[1],
       sum [3] = q[2]^c[2],
       sum [4] = q[3]^c[3];

assign c_out = c[3];

endmodule 