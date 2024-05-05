module mux_4to1_tb;

    // Señales
    logic d0, d1, d2, d3;  // Entradas de datos
    logic sel0, sel1;		// Señales de selección
    logic y;        			// Salida

    // Instanciar el módulo bajo test
    mux_4to1 uut (
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .sel0(sel0),
        .sel1(sel1),
        .y(y)
    );

    // Estímulo
    initial begin
        // Aplicar estímulo y observar resultados
        // Caso 1:
		  sel0 = 0;
        sel1 = 1;
        d0 = 0;
		  d1 = 1;
		  d2 = 0;
		  d3 = 0;
		  
        #10; // Esperar un tiempo para la propagación
		  
        // Caso 2:
		  sel0 = 1;
        sel1 = 0;
        d0 = 1;
		  d1 = 0;
		  d2 = 0;
		  d3 = 0;
		  
        #10; // Esperar un tiempo para la propagación
		  
        // Caso 3:
		  sel0 = 1;
        sel1 = 0;
        d0 = 0;
		  d1 = 0;
		  d2 = 1;
		  d3 = 0;
		  
        #10; // Esperar un tiempo para la propagación
		  
        // Caso 4:
		  sel0 = 1;
        sel1 = 1;
        d0 = 0;
		  d1 = 1;
		  d2 = 0;
		  d3 = 0;
		  
        #10; // Esperar un tiempo para la propagación
        // Finalizar la simulación
        $finish;
    end

endmodule
