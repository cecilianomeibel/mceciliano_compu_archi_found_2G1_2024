
module sumador_4 (
	input logic [3:0] A_num,
	input logic [3:0] B_num,
	input logic carry_in,
	output logic carry_out,
	output logic [3:0] result
);

logic [3:0] carry_int;
logic [3:0] result_int;


sumador_1 sum1(.A_num(A_num[0]), .B_num(B_num[0]), .carry_in(carry_in), .result(result_int[0]), .carry_out(carry_int[0]));
sumador_1 sum2(.A_num(A_num[1]), .B_num(B_num[1]), .carry_in(carry_int[0]), .result(result_int[1]), .carry_out(carry_int[1]));
sumador_1 sum3(.A_num(A_num[2]), .B_num(B_num[2]), .carry_in(carry_int[1]), .result(result_int[2]), .carry_out(carry_int[2]));
sumador_1 sum4(.A_num(A_num[3]), .B_num(B_num[3]), .carry_in(carry_int[2]), .result(result_int[3]), .carry_out(carry_int[3]));

assign carry_out = carry_int[3];
assign result = result_int;
	
endmodule