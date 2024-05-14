module mux_2to1_tb;

    // Señales
    logic [3:0] d0, d1;  // Entradas de datos
    logic sel;				 // Señales de selección
    reg [3:0] y;        		 // Salida

    // Instanciar el módulo bajo test
    mux_2to1 uut (
        .d0(d0),
        .d1(d1),
        .sel(sel),
        .y(y)
    );

    // Estímulo
    initial begin
        // Aplicar estímulo y observar resultados
        // Caso 1:
		  sel = 0;
        d0 = 4'b1111;
		  d1 = 4'b1011;	 
		  
        #10; // Esperar un tiempo para la propagación
        // Finalizar la simulación
        $finish;
    end

endmodule