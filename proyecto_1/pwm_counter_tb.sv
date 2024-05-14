module pwm_counter_tb;

    // Definición de señales
    logic clk = 0;
    logic rst = 0;
    logic [3:0] duty_multiplier; // Ejemplo de duty multiplier
    logic pwm_out;

    // Instanciar el módulo bajo prueba
    pwm_counter uut (
        .clk(clk),
        .rst(rst),
        .duty_multiplier(duty_multiplier),
        .pwm_out(pwm_out)
    );

    // Generar reloj
    always #5 clk = ~clk;

    // Proceso de reset
    initial begin
        rst = 0;
		#40
		
		rst = 1;
		duty_multiplier = 4'b0;
		#1024
		
		duty_multiplier = 4'b1;
		#1024
		
		duty_multiplier = 4'b0010;
		#1024
		
		duty_multiplier = 4'b0011;
		#1024
		
		duty_multiplier = 4'b0100;
		#1024
		
		duty_multiplier = 4'b0101;
		#1024
		
		duty_multiplier = 4'b0110;
		#1024
		
		duty_multiplier = 4'b0111;
		#1024
		
		duty_multiplier = 4'b1000;
		#1024
		
		duty_multiplier = 4'b1001;
		#1024
		
		duty_multiplier = 4'b1010;		

    end

    // Proceso de prueba
    initial begin
        // Espera un tiempo suficiente para que el contador alcance el valor máximo
        #100;

        // Detiene la simulación
        $finish;
    end

endmodule
