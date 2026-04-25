module mux16_1 (
    output y,
    input [15:0] a,
    input [3:0] s
);

assign y = s[3] ? s[2] ? s[1] ? s[0] ? a[15]:a[14] : s[0]?a[13]:a[12]
                       : s[1] ? s[0] ? a[11] : a[10] : s[0]?a[9]:a[8]
                :s[2] ? s[1] ? s[0] ? a[7]:a[6] : s[0]?a[5]:a[4]
                       : s[1] ? s[0] ? a[3] : a[2] : s[0]?a[1]:a[0];
    
endmodule