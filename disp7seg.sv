module disp7seg(
    input logic [3:0] result,
    output logic [6:0] seg
);



always_comb 
   case(result)
	
	 // gfedcba 0 enciende y 1 apaga
	 // g: HEX0[6] PIN_AH28
	 // f: HEX0[5] PIN_AG28
	 // e: HEX0[4] PIN_AF28
	 // d: HEX0[3] PIN_AG27
	 // c: HEX0[2] PIN_AE28
	 // b: HEX0[1] PIN_AE27
	 // a: HEX0[0] PIN_AE26
	      
	               //  gfedcba
    4'b0000: seg = 7'b1000000; 	//0
    4'b0001: seg = 7'b1111001; 	//1
    4'b0010: seg = 7'b0100100; 	//2
    4'b0011: seg = 7'b0110000; 	//3
    4'b0100: seg = 7'b0011001; 	//4
	 4'b0101: seg = 7'b0010010; 	//5 
    4'b0110: seg = 7'b0000010; 	//6
    4'b0111: seg = 7'b0111000; 	//7
	 4'b1000: seg = 7'b0000000; 	//8
	 4'b1001: seg = 7'b0011000; 	//9
	 4'b1010: seg = 7'b0001000; 	//10 A
	 4'b1011: seg = 7'b0000011; 	//11 b
	 4'b1100: seg = 7'b1000110; 	//12 C
	 4'b1101: seg = 7'b0100001; 	//13 d
	 4'b1110: seg = 7'b0000110; 	//14 E
	 4'b1111: seg = 7'b0001110; 	//15 F
    default: seg = 7'b1111111; 	//todos se apagan
   endcase
	
endmodule

















