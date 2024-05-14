module ControladorMotor (
	input logic [3:0] A_num,			//Primer operando
	input logic [3:0] B_num,			//Segundo operando
	input logic [1:0] ALUControl,		//Selector
	input logic clk, rst,								//CLk y Reset del PWM
	output logic [3:0] result,			//Resultado final elegido
	output logic V_flag, C_flag, N_flag, Z_flag,	//Banderas de la ALU
	output logic speed_motor,									//Velocidad de la motor
	output logic [6:0] seg


);
	 logic [3:0] result_int;
	
	
	 ALU_main ALU_inst (
        .A_num(A_num),
        .B_num(B_num),
        .ALUControl(ALUControl),
        .result(result_int),
		  .V_flag(V_flag),
		  .C_flag(C_flag),
		  .N_flag(N_flag),
		  .Z_flag(Z_flag)
    );
	 
	 PWM pwm_inst (
	     .clk(clk), 
		  .rstN(rst),
        .result(result_int),
		  .speed_motor(speed_motor)
    );
	 
	 disp7seg disp_inst(
		 .result(result_int),
		 .seg(seg)
	 );
	 
	 
	 assign result = result_int;

endmodule 