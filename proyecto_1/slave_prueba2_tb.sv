module slave_prueba2_tb();
	
	logic clk_arduino;
	logic MOSI; // [operando_1 , operando_2 , operador]
	logic CS;
	logic reset;
	logic MISO;
	logic [3:0] leds;
	
	slave_prueba2 prueba2(
		clk_arduino, 
		MOSI, // [operando_1 , operando_2 , operador]
		CS,
		reset,
		MISO,
		leds

	);
	
	
	always begin
		#10 clk_arduino = ~clk_arduino;
	end
	
	initial begin
	
		clk_arduino = 0;
		reset = 0;
		CS = 0;
		MOSI = 0;
		
		#10;
		
		reset = 1;
		MOSI = 1;
		CS = 1;
		
		#20
		// handshake
		reset = 1;
		CS = 0;
		MOSI = 1;
		
		#20;
		
		// ============================ Operando 1
		//  bit 3
		CS = 0;
		MOSI = 1;
		
		#20;
		
		//  bit 2
		CS = 0;
		MOSI = 1;
		
		#20;
		
		//  bit 1
		CS = 0;
		MOSI = 0;
		
		#20;
		
		//  bit 0
		CS = 0;
		MOSI = 0;
		
		#20;
		
		// ======================== Operando 2
		//  bit 3
		CS = 0;
		MOSI = 0;
		
		#20;
		
		//  bit 2
		CS = 0;
		MOSI = 1;
		
		#20;
		
		//  bit 1
		CS = 0;
		MOSI = 1;
		
		#20;
		
		//  bit 0
		CS = 0;
		MOSI = 0;
		
		#20; 
		
		// ================================= Operador
		//  bit 3
		CS = 0;
		MOSI = 1;
		
		#20;
		
		//  bit 2
		CS = 0;
		MOSI = 1;
		
		#20;
		
		//  bit 1
		CS = 0;
		MOSI = 0;
		
		#20;
		
		//  bit 0
		CS = 0;
		MOSI = 0;
		
		#20;
		
		CS = 1;
		
		
		#100
		
		// ============================ Operando 1 otra vuelta
		//  bit 3
		CS = 0;
		MOSI = 1;
		
		#20;
		
		//  bit 2
		CS = 0;
		MOSI = 0;
		
		#20;
		
		//  bit 1
		CS = 0;
		MOSI = 1;
		
		#20;
		
		//  bit 0
		CS = 0;
		MOSI = 1;
		
		#20;
		
		$finish;
		
	end
	
endmodule