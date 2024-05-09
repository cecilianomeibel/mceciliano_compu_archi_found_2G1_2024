module pwm (
	input reg[3:0] result, input logic clk, rst,
	output speed_motor
);
	
	reg[8:0] duty_cycle;
	reg [7:0] Q_reg, Q_next;
	
	always @ (posedge clk, negedge rst) begin
		if (!rst)
			Q_reg = 8'b00000000;
		else
			Q_reg = Q_next;
	end
	
	always @(*) begin
		Q_next = Q_reg + 1;
	end
	
	assign duty_cycle = result * (2**8)/15;
	assign speed_motor = (Q_reg < duty_cycle);
	
	disp7seg disp7seg_inst(
		 .result(result),
		 .seg(seg)
		  );
	
endmodule
