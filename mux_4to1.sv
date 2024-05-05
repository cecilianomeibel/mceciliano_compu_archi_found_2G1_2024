module mux_4to1 (
    input logic d0, d1, d2, d3, 	// Entradas de datos
    input logic sel0, sel1, 	   // Selector de entrada
    output logic y 					// Salida
);

//Variables internas

logic y_mux1;

logic y_mux2;


mux_2to1 mux1 (.d0(d0), .d1(d1), .sel(sel0), .y(y_mux1)); //Primer Mux

mux_2to1 mux2 (.d0(d2), .d1(d3), .sel(sel0), .y(y_mux2)); //Segundo Mux

mux_2to1 mux3 (.d0(y_mux1), .d1(y_mux2), .sel(sel1), .y(y)); //Tercer Mux


endmodule