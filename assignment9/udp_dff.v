// ============================================================
// Positive Edge Triggered D Flip-Flop - Sequential UDP
// This is the core building block used by all three designs
// ============================================================

primitive udp_dff (q, clk, d);
    output reg q;
    input      clk, d;

    initial q = 0;

    table
        // clk  d : q  : q+
        // Positive edge: latch D
        (01)  0  : ?  : 0;
        (01)  1  : ?  : 1;

        // Negative edge or steady clock: hold state
        (0?)  ?  : ?  : -;
        (1?)  ?  : ?  : -;
        (?0)  ?  : ?  : -;
        (?1)  ?  : ?  : -;
    endtable
endprimitive
