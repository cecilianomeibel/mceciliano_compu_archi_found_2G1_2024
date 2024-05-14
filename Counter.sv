module Counter (
	input clk,
	input rst,
	output reg[3:0] out);
	
	logic [3:0] next_out;
	
	Ripple_Carry_Adder rca (out, 4'd1, 1'd0, next_out);
	
	always @(posedge clk, negedge rst) begin
	 out = (!rst)? 4'd0 : next_out;
	end
endmodule