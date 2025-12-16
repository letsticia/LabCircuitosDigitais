module somador_8_bits (vet1, vet2, cin,vetr, cout);

parameter LARG_TOTAL = 8; // Define que o somador total tem 8 bits de largura
parameter QTD_BLOCOS = 2; // Define que vamos dividir o circuito em 2 blocos menores
parameter LARG_BLOCO =  LARG_TOTAL / QTD_BLOCOS; // Calcula automaticamente o tamanho de cada bloco (8 / 2 = 4 bits)

// --- ENTRADAS E SAÍDAS ---
input [(LARG_TOTAL-1):0] vet1;
input [(LARG_TOTAL-1):0] vet2;
input cin;
output [(LARG_TOTAL-1):0] vetr;
output cout;
  
// --- DECLARAÇÃO DE FIOS (Wires) ---
wire [(LARG_TOTAL-1):0] vet1;
wire [(LARG_TOTAL-1):0] vet2;
wire cin;
wire [(LARG_TOTAL-1):0] vetr;
wire cout;
wire [(QTD_BLOCOS-1):0] carry_chain;

// --- INSTÂNCIA 1: Parte BAIXA (Menos Significativa - LSB) ---
// Pega os bits [3:0]
somador_4_bits somador1 ( .vet1(vet1[(LARG_BLOCO-1):0]),
.vet2(vet2[(LARG_BLOCO-1):0]),
.cin (cin),
.vetr(vetr[(LARG_BLOCO-1):0]),
.cout(carry_chain[0]) );

// --- INSTÂNCIA 2: Parte ALTA (Mais Significativa - MSB) ---
// Pega os bits [7:4]
somador_4_bits somador2 ( .vet1(vet1[(LARG_TOTAL-1):(LARG_BLOCO)]),
.vet2(vet2[(LARG_TOTAL-1):(LARG_BLOCO)]),
.cin(carry_chain[0]),
.vetr(vetr[(LARG_TOTAL-1):(LARG_BLOCO)]),
.cout(carry_chain[1]) );
  
// --- SAÍDA FINAL ---
assign cout = carry_chain[1];  // Conecta o carry que saiu do último bloco à saída externa do chip

endmodule 