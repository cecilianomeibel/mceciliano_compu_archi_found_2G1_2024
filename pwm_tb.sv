module pwm_tb();
   
    reg [3:0] ALU_result; 
    logic clk, rst, speed_motor;
    
    pwm prueba(
        .ALU_result(ALU_result),
		  .clk(clk), 
		  .rst(rst), 
		  .speed_motor(speed_motor)
    );
	 
	 
	  always begin 
		#2; clk = 0;
		#2; clk = 1;
	  end
	 
	 
	
    initial begin
        rst = 0;
		  #40
		  rst = 1;
        
        result = 4'b0000;
        #1024;
        
        result = 4'b1000;
		  
        #1024;
		  
        result = 4'b0010;
        #1024;
        
        result = 4'b0011;
        #1024;

        result = 4'b0100;
        #1024;
        
        result = 4'b0101;
        #1024
        
		  result = 4'b0110;
        #1024;
        
        result = 4'b0111;
        #1024;
        
        result = 4'b1000;
        #1024;
        
        result = 4'b1001;
        #1024;
    
        result = 4'b1011;
        #1024;
        
        result = 4'b1011;
        #1024;
        
        result = 4'b1100;
        #1024;
        
        result = 4'b1101;
        #1024;
        
        result = 4'b1110;
        #1024;
        
        result = 4'b1111;
		  
		  $finish;
    end
    
endmodule
