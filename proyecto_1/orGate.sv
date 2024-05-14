module orGate(
	input logic [3:0] a,			//Primer operando
	input logic [3:0] b,			//Segundo operando
	output logic [3:0] result	//Resultado final
);
 

    always_comb begin
        result = a | b;	//Operación OR
    end

endmodule