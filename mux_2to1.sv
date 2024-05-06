module mux_2to1 (
    input logic [3:0] d0, d1, // Entradas de datos
    input logic sel, 	// Selector de entrada
    output logic [3:0] y 		// Salida
);

logic [3:0] and1;
logic [3:0] and2;
logic [3:0] sel_temp;
logic [3:0] sel_in;


		always @(*) begin
			sel_in[0] = sel;
			sel_in[1] = sel;
			sel_in[2] = sel;
			sel_in[3] = sel;
			sel_temp = ~sel_in;
			and1 = (d0 & sel_temp);
			and2 = (d1 & sel_in);

			y = and1 | and2;
		
		end

endmodule


