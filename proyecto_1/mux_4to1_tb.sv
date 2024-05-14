module mux_4to1_tb;

    // Señales
    logic [3:0] d0, d1, d2, d3;  // Entradas de datos
    logic [1:0] sel;					// Señales de selección
    logic [3:0] y;        			// Salida

    // Instanciar el módulo bajo test
    mux_4to1 uut (
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .sel(sel),
        .y(y)
    );

    // Estímulo
    initial begin
        // Aplicar estímulo y observar resultados
        // Caso 1:
		  sel = 2'b01;
        d0 = 4'b1110;
		  d1 = 4'b1010;
		  d2 = 4'b0110;
		  d3 = 4'b1111;		 
		  
        #10; // Esperar un tiempo para la propagación
        // Finalizar la simulación
        $finish;
    end

endmodule
