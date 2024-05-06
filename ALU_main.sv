module ALU_main(

	input logic [3:0] A_num,
	input logic [3:0] B_num,
	input logic [1:0] ALUControl,
	output logic [3:0] result
	
);

	//Variables internas
	
	logic [3:0] B_neg;
	logic [3:0] B_final;
	logic [3:0] result_and;
	logic [3:0] result_or;
	logic [3:0] result_sum;
	logic cout;
	
	//Obteniendo el complmento de B_num
	always @(*) begin
	B_neg <= ~B_num;
	end
	
	// Instancia del módulo del MUX 2:1
    mux_2to1 mux_2 (
        .d0(B_num),
        .d1(B_neg),
        .sel(ALUControl[0]),
        .y(B_final)
    );

	// Instancia del módulo del Sumador
	sumador_4 sumador_nums(
		.A_num(A_num), 
		.B_num(B_final), 
		.carry_in(ALUControl[0]), 
		.carry_out(cout), 
		.result(result_sum)
	);

	// Instancia del módulo OR
	orGate or_nums (
      .a(A_num),
      .b(B_num),
      .result(result_or)
	);
	
	// Instancia del módulo AND
	AND_gate and_nums(
		.A_num(A_num), 
		.B_num(B_num), 
		.result(result_and)
	);
	
	// Instancia del módulo del Mux 4:1
    mux_4to1 mux_4 (
        .d0(result_sum),
        .d1(result_sum),
        .d2(result_and),
        .d3(result_or),
        .sel(ALUControl),
        .y(result)
    );
	 

endmodule