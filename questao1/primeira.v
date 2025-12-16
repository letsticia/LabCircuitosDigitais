module circuito_logico_complexo (
    input a, 
    input b, 
    input c, 
    input d,
    output S
);


    wire not_a, not_b;
    

    wire term_nb_d;      
    wire term_c_d;       
    wire term_or_inner; 
    wire term_big_and;   
    wire left_side;      
    

    wire term_b_d;      
    wire term_not_bd;    
    wire term_nota_or_c; 
    wire term_and_mid;   
    wire term_big_or;    
    wire right_side;     


    not U1 (not_a, a);
    not U2 (not_b, b);



    and U3 (term_nb_d, not_b, d);


    and U4 (term_c_d, c, d);


    or U5 (term_or_inner, term_nb_d, term_c_d);


    and U6 (term_big_and, term_nb_d, not_a, term_or_inner);

    not U7 (left_side, term_big_and);


    and U8 (term_b_d, b, d);

    not U9 (term_not_bd, term_b_d);

    or U10 (term_nota_or_c, not_a, c);

    and U11 (term_and_mid, term_nota_or_c, term_not_bd);

    or U12 (term_big_or, c, term_and_mid);

    not U13 (right_side, term_big_or);

    and U14 (S, left_side, right_side);

endmodule