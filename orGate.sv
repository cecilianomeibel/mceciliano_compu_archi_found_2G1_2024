module orGate(
	input logic [3:0] a,
	input logic [3:0] b,
	output logic [3:0] result
);
 

    always_comb begin
        result = a | b;
    end

endmodule