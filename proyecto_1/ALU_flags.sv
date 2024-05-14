module ALU_flags(

	input logic A_msb,					//MSB del primer operando
	input logic B_msb,					//MSB del segundo operando
	input logic [1:0] ALUControl,		//Selector
	input logic [3:0] result,			//Resultado final elegido
	input logic Sum_msb,					//MSB del resultado del sumador
	input logic [3:0] result_MSB,    //MSB del resultado final elegido
	input logic cout,
	output logic V_flag, C_flag, N_flag, Z_flag	//Banderas de la ALU
);
	//Bandera de Carry
	assign C_flag = ~ALUControl[1] & cout;
	
	//Bandera de Overflow
	assign V_flag = (~(ALUControl[1] ^ A_msb ^ B_msb)) & (A_msb ^ Sum_msb) & (~ALUControl[1]);
	
	//Bandera de Negativo
	assign N_flag = result_MSB;
	
	//Bandera de Resultado igual a Cero
	assign Z_flag = ~(result[0] | result[1] | result[2] | result[3]); //*Revisar*

endmodule