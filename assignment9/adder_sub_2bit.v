// ============================================================
// 2-bit Adder-cum-Subtractor using Combinational UDPs
// Mode select: M=0 -> Addition, M=1 -> Subtraction
// For subtraction: B is XORed with M (2's complement method)
//   Effective carry-in = M
// Inputs : A[1:0], B[1:0], M (mode)
// Outputs: S[1:0] (sum/difference), Cout (carry/borrow-out)
//
// Each 1-bit full adder slice:
//   Sum   = A ^ B_eff ^ Cin
//   Carry = (A & B_eff) | (B_eff & Cin) | (A & Cin)
// where B_eff = B ^ M (invert B when subtracting)
// ============================================================

// UDP: XOR of two bits (used for B effective: B^M)
primitive udp_xor2 (y, a, b);
    output y;
    input  a, b;

    table
        // a  b : y
           0  0 : 0;
           0  1 : 1;
           1  0 : 1;
           1  1 : 0;
    endtable
endprimitive


// UDP: Full Adder Sum = A ^ B ^ Cin
primitive udp_fa_sum (s, a, b, cin);
    output s;
    input  a, b, cin;

    table
        // a  b cin : s
           0  0  0  : 0;
           0  0  1  : 1;
           0  1  0  : 1;
           0  1  1  : 0;
           1  0  0  : 1;
           1  0  1  : 0;
           1  1  0  : 0;
           1  1  1  : 1;
    endtable
endprimitive


// UDP: Full Adder Carry = majority(A,B,Cin)
primitive udp_fa_carry (cout, a, b, cin);
    output cout;
    input  a, b, cin;

    table
        // a  b cin : cout
           0  0  0  :  0;
           0  0  1  :  0;
           0  1  0  :  0;
           0  1  1  :  1;
           1  0  0  :  0;
           1  0  1  :  1;
           1  1  0  :  1;
           1  1  1  :  1;
    endtable
endprimitive


// Top-level 2-bit Adder/Subtractor module
module adder_sub_2bit (
    input  [1:0] A,
    input  [1:0] B,
    input        M,       // 0=Add, 1=Subtract
    output [1:0] S,
    output       Cout
);
    wire b0_eff, b1_eff;  // B XOR M
    wire c1;              // intermediate carry

    // B effective = B XOR M (invert B bits when M=1)
    udp_xor2 Ux0 (b0_eff, B[0], M);
    udp_xor2 Ux1 (b1_eff, B[1], M);

    // Bit-0 slice (Cin = M for 2's complement)
    udp_fa_sum   US0 (S[0],  A[0], b0_eff, M);
    udp_fa_carry UC0 (c1,    A[0], b0_eff, M);

    // Bit-1 slice
    udp_fa_sum   US1 (S[1],  A[1], b1_eff, c1);
    udp_fa_carry UC1 (Cout,  A[1], b1_eff, c1);
endmodule


// Testbench
module tb_adder_sub_2bit;
    reg  [1:0] A, B;
    reg        M;
    wire [1:0] S;
    wire       Cout;

    adder_sub_2bit DUT (.A(A), .B(B), .M(M), .S(S), .Cout(Cout));

    integer i, j;
    initial begin
        $display("=== 2-bit Adder-cum-Subtractor Testbench ===");
        $display("");
        $display("--- ADDITION (M=0) ---");
        $display(" A   B  | Cout S  | Decimal");
        $display("--------|---------|--------");
        M = 0;
        for (i = 0; i < 4; i = i + 1)
            for (j = 0; j < 4; j = j + 1) begin
                A = i; B = j; #10;
                $display(" %b  %b  |   %b  %b  | %0d + %0d = %0d", A, B, Cout, S, A, B, {Cout,S});
            end

        $display("");
        $display("--- SUBTRACTION (M=1) ---");
        $display(" A   B  | Cout S  | Decimal (Cout=0 means borrow/negative)");
        $display("--------|---------|--------------------------------------");
        M = 1;
        for (i = 0; i < 4; i = i + 1)
            for (j = 0; j < 4; j = j + 1) begin
                A = i; B = j; #10;
                $display(" %b  %b  |   %b  %b  | %0d - %0d = %0d (Cout=%b)", A, B, Cout, S, A, B, $signed({1'b0,S}), Cout);
            end
        $finish;
    end
endmodule
