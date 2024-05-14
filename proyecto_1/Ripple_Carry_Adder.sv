module Ripple_Carry_Adder (
	input logic [3:0] A,
	input logic [3:0] B,
	input logic Cin,
	output logic [3:0] S,
	output logic [3:0] Cout
);

	Full_Adder_1Bit sum1(A[0], B[0], Cin, S[0], Cout[0]);
	Full_Adder_1Bit sum2(A[1], B[1], Cout[0], S[1], Cout[1]);
	Full_Adder_1Bit sum3(A[2], B[2], Cout[1], S[2], Cout[2]);
	Full_Adder_1Bit sum4(A[3], B[3], Cout[2], S[3], Cout[3]);

endmodule