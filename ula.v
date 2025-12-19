module ula(
    input  [1:0] A,
    input  [1:0] B,
    input  [1:0] S,
    output [1:0] R,
    output Cout
);

    wire [1:0] B_sub;
    wire cin;
    wire c1, c2;

    // Subtração: A - B = A + (~B + 1)
    assign B_sub[0] = B[0] ^ S[0];   // inverte se S == 01
    assign B_sub[1] = B[1] ^ S[0];
    assign cin = S[0];               // cin = 1 para subtração

    // ----- FULL ADDER DO BIT 0 -----
    wire sum0_1, carry0_1, carry0_2, carry0_3;
    wire R_sum0;

    assign sum0_1  = A[0] ^ B_sub[0];
    assign R_sum0  = sum0_1 ^ cin;

    assign carry0_1 = A[0] & B_sub[0];
    assign carry0_2 = A[0] & cin;
    assign carry0_3 = B_sub[0] & cin;

    assign c1 = carry0_1 | carry0_2 | carry0_3;

    // ----- FULL ADDER DO BIT 1 -----
    wire sum1_1, carry1_1, carry1_2, carry1_3;
    wire R_sum1;

    assign sum1_1  = A[1] ^ B_sub[1];
    assign R_sum1  = sum1_1 ^ c1;

    assign carry1_1 = A[1] & B_sub[1];
    assign carry1_2 = A[1] & c1;
    assign carry1_3 = B_sub[1] & c1;

    assign c2 = carry1_1 | carry1_2 | carry1_3;

    // ----- OPERACOES LOGICAS -----
    wire [1:0] R_and = A & B;
    wire [1:0] R_or  = A | B;

    // ----- RESULTADO FINAL -----
    assign R = (S == 2'b00) ? {R_sum1, R_sum0} :   // Soma
               (S == 2'b01) ? {R_sum1, R_sum0} :   // Subtração
               (S == 2'b10) ? R_and :
                               R_or;

    // ----- COUT CORRIGIDO -----
    assign Cout = (S[1] == 1'b0) ? c2 : 1'b0;

endmodule