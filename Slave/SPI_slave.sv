module SPI_slave(
	input logic clk_arduino, 
	input logic MOSI, // [operando_1 , operando_2 , operador]
	input logic CS,
	input logic reset,
	output logic MISO,
	output logic [3:0] leds
	//output logic reset,
	//output logic pwm_out
	);
	
	logic state_actual; 
	logic state_next = 0;
	logic handShake_confirmation = 0;
	logic [3:0] operando_1 = 4'b0000;
	logic [3:0] operando_2 = 4'b0000;
	logic [3:0] operador = 4'b0;
	logic enable;
	
	
	always @(posedge clk_arduino) begin
		
		state_actual <= state_next;

		enable <= handShake_confirmation & ~CS;
		
		operando_1 <= (state_actual >= 0 && state_actual <= 3 && handShake_confirmation == 1 && CS == 0) ? {operando_1[2:0], MOSI} : operando_1;
		
		operando_2 <= (state_actual >= 4 && state_actual <= 7 && handShake_confirmation == 1 && CS == 0) ? {operando_2[2:0], MOSI} : operando_2;
		
		operador <= (state_actual >= 8 && state_actual <= 11 && handShake_confirmation == 1 && CS == 0) ? {operador[2:0], MOSI} : operador;
		
		//handShake_confirmation = (state_next >= 11) ? 0 : state_next;
		
		leds <= (state_actual == 11 && enable) ? operando_1 : 0;
		
		//state_next = (state_next >= 11) ? 0 : state_next;
		
		state_next <= (enable && state_next < 11) ? state_next + 1 : 0;
		
		handShake_confirmation <= (handShake_confirmation == 0 && MOSI == 1 && CS == 0) ? 1 : handShake_confirmation;
		
		MISO <= (handShake_confirmation == 1) ? 1: 0;
		
	end
	
endmodule