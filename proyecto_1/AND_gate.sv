
module AND_gate (
	input logic [3:0] A_num,	//Primer operando
	input logic [3:0] B_num,	//Segundo operando
	output logic [3:0] result	//Resultado final
);
	
	
	always_comb begin
		result = A_num & B_num; // Operación AND		
	end
	
	endmodule