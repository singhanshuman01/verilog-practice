module cla(sum, c_out, a, b, c_in);
output [3:0]sum;
output c_out;
input [3:0]a;
input [3:0]b;
input c_in;

wire [3:0]p;
wire [3:0]g;
wire [3:0]c;

assign p[0] = a[0]^b[0],
       p[1] = a[1]^b[1],
       p[2] = a[2]^b[2],
       p[3] = a[3]^b[3];
       
assign g[0] = a[0]&b[0],
       g[1] = a[1]&b[1],
       g[2] = a[2]&b[2],
       g[3] = a[3]&b[3];
       
assign c[0] = g[0] | (p[0]&c_in),
       c[1] = g[1] | (p[1]&g[0]) | (p[1]&p[0]&c_in),
       c[2] = g[2] | (p[2]&g[1]) | (p[2]&p[1]&g[0]) | (p[2]&p[1]&p[0]&c_in),
       c[3] = g[3] | (p[3]&g[2]) | (p[3]&p[2]&g[1]) | (p[3]&p[2]&p[1]&g[0]) | (p[3]&p[2]&p[1]&p[0]&c_in);

assign sum [0] = p[0]^c_in,
       sum [1] = p[1]^c[0],
       sum [2] = p[2]^c[1],
       sum [3] = p[3]^c[2];

assign c_out = c[3]; 


endmodule 