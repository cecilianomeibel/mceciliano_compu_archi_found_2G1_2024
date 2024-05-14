module sumador_tb();
	
	logic [3:0] A_num;
	logic [3:0] B_num;
	logic carry_in;
	logic carry_out;
	logic [3:0] result;
	
	sumador_4 sumador_nums(.A_num(A_num), .B_num(B_num), .carry_in(carry_in), .carry_out(carry_out), .result(result));
	
	initial begin
	
		A_num = 4'b0101;
		B_num = 4'b0110;
		carry_in = 0;
		
		#5
		
		A_num = 4'b1111;
		B_num = 4'b1111;
		carry_in = 0;
		
		#5
		
		carry_in = 1;
		A_num = 4'b0111;
		B_num = ~4'b0101;
		
		#5
		
		$finish;
	
	end

endmodule