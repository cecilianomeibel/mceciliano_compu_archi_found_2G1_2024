
module AND_gate (
	input logic [3:0] A_num,
	input logic [3:0] B_num,
	output logic [3:0] result
);
	
	
	always_comb begin
		result = A_num & B_num; // operación AND		
	end
	
	endmodule