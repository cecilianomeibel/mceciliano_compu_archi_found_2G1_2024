module SPI_slave_tb();
	
	
	logic clk_arduino;
	logic MOSI;
	logic CS;
	logic reset;
	logic MISO;
	logic [3:0] leds;
	
	
	SPI_slave slave(
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
		// handshake
		CS = 0;
		MOSI = 1;
		
		#20;
		
		//  bit 0
		CS = 0;
		MOSI = 1;
		
		#20;
		
		//  bit 1
		CS = 0;
		MOSI = 1;
		
		#20;
		
		//  bit 2
		CS = 0;
		MOSI = 0;
		
		#20;
		
		//  bit 3
		CS = 0;
		MOSI = 0;
		
		#20;
		
		$finish;
		
	end
endmodule