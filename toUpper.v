`timescale 1ns / 1ps

module toUpper(
    input  [7:0] in_char,
    output [7:0] out_char
);

    // inverted signals
    wire nA0, nA1, nA2, nA3, nA4, nA5, nA6, nA7;
    not #(5) N0(nA0, in_char[0]);
    not #(5) N1(nA1, in_char[1]);
    not #(5) N2(nA2, in_char[2]);
    not #(5) N3(nA3, in_char[3]);
    not #(5) N4(nA4, in_char[4]);
    not #(5) N5(nA5, in_char[5]);
    not #(5) N6(nA6, in_char[6]);
    not #(5) N7(nA7, in_char[7]);

    // AND terms for sum-of-products
    wire term1, term2, term3, term4, term5;
    and #(10) Term1(term1, nA7, nA6, in_char[5]);
    and #(10) Term2(term2, nA7, in_char[5], nA4, nA3, nA2, nA1, nA0);
    and #(10) Term3(term3, nA7, in_char[6], in_char[5], in_char[4], in_char[3], in_char[2]);
    and #(10) Term4(term4, nA7, in_char[6], in_char[5], in_char[4], in_char[3], nA2, in_char[1], in_char[0]);
    and #(10) Term5(term5, in_char[7], in_char[5]);

    // OR gate for out_char[5]
    or #(10) SOP_OR(out_char[5], term1, term2, term3, term4, term5);

    // Pass-through other bits
    buf #(4) B7(out_char[7], in_char[7]);
    buf #(4) B6(out_char[6], in_char[6]);
    buf #(4) B4(out_char[4], in_char[4]);
    buf #(4) B3(out_char[3], in_char[3]);
    buf #(4) B2(out_char[2], in_char[2]);
    buf #(4) B1(out_char[1], in_char[1]);
    buf #(4) B0(out_char[0], in_char[0]);

endmodule
