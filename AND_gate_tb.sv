module AND_gate_tb();
	
	//Definir señales
	
	logic [3:0] A_num;
	logic [3:0] B_num;
	logic [3:0] result;
	
	// Instancia del módulo bajo prueba
	AND_gate And_tb(.A_num(A_num), .B_num(B_num), .result(result));
	
	
	initial begin
	
		// Establecer valores de entrada
		A_num = 4'b1000;
		B_num = 4'b1010;
		
		#5 // Esperar un tiempo para la propagación
		
		// Establecer nuevos valores de entrada
		A_num = 4'b1110;
		B_num = 4'b1011;
		
		#5 // Esperar un tiempo para la propagación
		
		// Establecer nuevos valores de entrada
		A_num = 4'b1011;
		B_num = 4'b1100;
		
		#5 // Esperar un tiempo para la propagación
		
		// Establecer nuevos valores de entrada
		A_num = 4'b0111;
		B_num = 4'b1000;
		
		#5 // Esperar un tiempo para la propagación
		
		$finish;
	
	end
	
	
endmodule