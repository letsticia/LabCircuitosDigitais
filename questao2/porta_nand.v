module porta_nand (
    input a,
    input b,
    output y
);

    nand U1 (y, a, b);

endmodule