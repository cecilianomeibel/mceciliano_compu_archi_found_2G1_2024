module Comparator  (
  input [3:0] A, B, 
  output N);
  
  bit CTRL = 1;
  bit C;
  bit [3:0] S;
  bit [3:0] Bc, Cout;
  genvar g;
  
  assign Bc[0] = B[0] ^ CTRL;
    
  Full_Adder_1Bit fa0(A[0], Bc[0], CTRL, S[0], Cout[0]);
  generate
    for(g = 1; g<4; g++) begin : full_adder_instantiation
      assign Bc[g] = B[g] ^ CTRL;
      Full_Adder_1Bit fa(A[g], Bc[g], Cout[g-1], S[g], Cout[g]);
    end
	 // Checks Flags
	 assign C = (Cout[4-1] == 1) ? 1 : 0;
	 assign N = (CTRL == 1 && C == 0) ? 0 : 1;
  endgenerate
  
endmodule 