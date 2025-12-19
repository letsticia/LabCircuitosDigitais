module bcd_7seg_anode (
    input  [3:0] bcd,   // Entrada BCD
    output reg [6:0] seg // Saída: seg[0]=a, seg[1]=b, seg[2]=c, seg[3]=d, seg[4]=e, seg[5]=f, seg[6]=g
);

    // Lógica de Ânodo Comum: 0 acende, 1 apaga
    // Ordem dos bits no vetor: {g, f, e, d, c, b, a}
    
    always @(*) begin
        case (bcd)
            //            g f e d c b a
            4'b0000: seg = 7'b1000000; // 0
            4'b0001: seg = 7'b1111001; // 1
            4'b0010: seg = 7'b0100100; // 2
            4'b0011: seg = 7'b0110000; // 3
            4'b0100: seg = 7'b0011001; // 4
            4'b0101: seg = 7'b0010010; // 5
            4'b0110: seg = 7'b0000010; // 6
            4'b0111: seg = 7'b1111000; // 7
            4'b1000: seg = 7'b0000000; // 8
            4'b1001: seg = 7'b0010000; // 9
            default: seg = 7'b1111111; // Apagado
        endcase
    end

endmodule