module mux_2to1 (
    input logic d0, d1, // Entradas de datos
    input logic sel, // Selector de entrada
    output logic y // Salida
);

    assign y = (d0 & ~sel) | (d1 & sel);

endmodule
