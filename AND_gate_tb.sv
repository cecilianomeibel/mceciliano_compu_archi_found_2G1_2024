module AND_gate_tb();
	
	logic [3:0] A_num;
	logic [3:0] B_num;
	logic [3:0] result;
	
	AND_gate And_tb(.A_num(A_num), .B_num(B_num), .result(result));
	
	
	initial begin
	
		A_num = 4'b1000;
		B_num = 4'b1010;
		
		#5
		
		A_num = 4'b1110;
		B_num = 4'b1011;
		
		#5
		
		A_num = 4'b1011;
		B_num = 4'b1100;
		
		#5
		
		A_num = 4'b0111;
		B_num = 4'b1000;
		
		#5
		
		$finish;
	
	end
	
	
endmodule