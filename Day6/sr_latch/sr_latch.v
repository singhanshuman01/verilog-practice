// SR Latch using NAND gates
module sr_latch (
    input wire sn, // Set (Active Low)
    input wire rn, // Reset (Active Low)
    output wire q,
    output wire qn
);
// assign q=1'b0;
// assign qn=~q;
    // NAND gates for cross-coupled feedback
    nand g1(q, sn, qn);
    nand g2(qn, rn, q);

endmodule