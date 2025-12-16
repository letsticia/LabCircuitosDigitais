module somador_4_bits (
   input [3:0] vet1,   // Operando A (4 bits: 3 até 0)
   input [3:0] vet2,   // Operando B (4 bits: 3 até 0)
   input cin,          // Carry In inicial (vem de fora ou do bloco anterior)
   output [3:0] vetr,  // Resultado da soma (4 bits)
   output cout         // Carry Out final (vai para fora ou para o próximo bloco)
);
	
  	// Fios internos para transportar o "vai um" entre os bits
    wire c1, c2, c3;  // c1 liga o bit 0 ao bit 1, c2 liga o bit 1 ao bit 2, c3 liga o bit 2 ao bit 3

// --- Bit 0 (Menos Significativo) ---
    full_adder bit_0 (
        .a(vet1[0]), 
        .b(vet2[0]), 
        .cin(cin), 
        .sum(vetr[0]), 
        .cout(c1)  
    );

// --- Bit 1 ---
    full_adder bit_1 (
        .a(vet1[1]), 
        .b(vet2[1]), 
        .cin(c1),
        .sum(vetr[1]), 
        .cout(c2)
    );
  
// --- Bit 2 ---
    full_adder bit_2 (
        .a(vet1[2]), 
        .b(vet2[2]), 
        .cin(c2),
        .sum(vetr[2]), 
        .cout(c3)
    );

// --- Bit 3 ---
    full_adder bit_3 (
        .a(vet1[3]), 
        .b(vet2[3]), 
        .cin(c3),
        .sum(vetr[3]), 
        .cout(cout)
    );

endmodule