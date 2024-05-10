module slave_prueba2(
	input logic clk_arduino, 
	input logic MOSI, // [operando_1 , operando_2 , operador]
	input logic CS,
	input logic reset,
	output logic MISO,
	output logic [3:0] leds
	
	);
	
	logic handShake_confirmation = 0;
	logic [3:0] operando_1 = 4'b0000;
	logic [3:0] operando_2 = 4'b0000;
	logic [3:0] operador = 4'b0000;
	int contador_bits = 0;
	logic enable = 0;
	
	
	always @(posedge clk_arduino or negedge reset) begin
		
		if(!reset) begin
			operando_1 = 4'b0000;
			operando_2 = 4'b0000;
			contador_bits = 4'b0000;
			operador = 4'b0000;
			enable = 0;
		end
		else begin
			operando_1[3] = (handShake_confirmation == 1 && contador_bits == 0 && CS == 0) ? MOSI: operando_1[3];
			operando_1[2] = (handShake_confirmation == 1 && contador_bits == 1 && CS == 0) ? MOSI: operando_1[2];
			operando_1[1] = (handShake_confirmation == 1 && contador_bits == 2 && CS == 0) ? MOSI: operando_1[1];
			operando_1[0] = (handShake_confirmation == 1 && contador_bits == 3 && CS == 0) ? MOSI: operando_1[0];
			
			operando_2[3] = (handShake_confirmation == 1 && contador_bits == 4 && CS == 0) ? MOSI: operando_2[3];
			operando_2[2] = (handShake_confirmation == 1 && contador_bits == 5 && CS == 0) ? MOSI: operando_2[2];
			operando_2[1] = (handShake_confirmation == 1 && contador_bits == 6 && CS == 0) ? MOSI: operando_2[1];
			operando_2[0] = (handShake_confirmation == 1 && contador_bits == 7 && CS == 0) ? MOSI: operando_2[0];
			
			operador[3] = (handShake_confirmation == 1 && contador_bits == 8 && CS == 0) ? MOSI: operador[3];
			operador[2] = (handShake_confirmation == 1 && contador_bits == 9 && CS == 0) ? MOSI: operador[2];
			operador[1] = (handShake_confirmation == 1 && contador_bits == 10 && CS == 0) ? MOSI: operador[1];
			operador[0] = (handShake_confirmation == 1 && contador_bits == 11 && CS == 0) ? MOSI: operador[0];
			
			enable = (contador_bits >= 11) ? 1: 0;
			
			contador_bits = (handShake_confirmation == 1 && CS == 0) ? contador_bits + 1: 0;
			
			handShake_confirmation = (CS == 0 && MOSI == 1) ? 1: handShake_confirmation;
			
		
			MISO = (handShake_confirmation == 1) ? 1: 0;
			
			leds = (enable == 1) ? operando_2: leds;
		end
		
	end
	
	
endmodule
	