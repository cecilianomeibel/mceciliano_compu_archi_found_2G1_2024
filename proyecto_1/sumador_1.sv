module sumador_1 (
    input logic A_num,B_num,carry_in,         // Entrada del primer número de 4 bits,Entrada del segundo número de 4 bits, Acarreo de entrada
    output logic result,carry_out				 //Resultado de la suma, Acarreo de salida
	 
);   
                     
                
               
    // Variables internas
    logic p, g;

    // Proceso para calcular p y g
    
    assign p = A_num ^ B_num;               // p es la suma (a+b)
    assign g = A_num & B_num;               // g es la multiplicación (a*b)

    // Proceso para calcular las salidas
    assign result = p ^ carry_in;           // suma de (p+Cin)
    assign carry_out = g | (p & carry_in);  // Solución g+(p*Cin)

endmodule