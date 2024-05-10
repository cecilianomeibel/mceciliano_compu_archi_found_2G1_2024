module PWM_tb();
	logic clk, rstN, speed_motor;
	logic [3:0] result;
	
	PWM pwm_inst(clk, rstN, result, speed_motor);
	
	initial begin
		 clk = 0;
		 forever #1 clk = ~clk;
	end
	
	initial begin
		rstN = 0;
		#5
		rstN = 1;
		result = 4'b0000;
		#100
		result = 4'b0001;
		#100
		result = 4'b0010;
		#100
		result = 4'b0011;
		#100
		result = 4'b0100;
		#100
		result = 4'b0101;
		#100
		result = 4'b0110;
		#100
		result = 4'b0111;
		#100
		result = 4'b1000;
		#100
		#100
		result = 4'b1001;
		#100
		result = 4'b1010;
		#100
		result = 4'b1011;
		#100
		result = 4'b1100;
		#100
		result = 4'b1101;
		#100
		result = 4'b1110;
		#100
		result = 4'b1111;
		#100
		$finish;
	end
	
endmodule
