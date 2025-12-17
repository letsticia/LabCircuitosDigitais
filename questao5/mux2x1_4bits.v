module mux2x1_4bits (
    input  [3:0] I0,    // Entrada 0 de 4 bits
    input  [3:0] I1,    // Entrada 1 de 4 bits
    input        S0,    // Seletor
    output [3:0] F      // Saída de 4 bits
);

    // Atribuição contínua utilizando o operador condicional (ternário)
    assign F = (S0 == 1'b1) ? I1 : I0;

endmodule