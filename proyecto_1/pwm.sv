module PWM 
	(input  logic                 clk,
	 input  logic                 rstN,
	 input  logic [3:0] result,
	 output logic                 speed_motor);

  logic [3:0] Q;
  logic pwmNext, aboveResult;
  
  Counter counter(clk, rstN, Q);
  Comparator comparator(Q, result, aboveResult);
  
  always_comb begin
	 pwmNext = (aboveResult)? 0 : 1;
  end

  always_ff @(posedge clk or negedge rstN) begin
    speed_motor = (!rstN)? 4'd0 : pwmNext;
  end

endmodule
