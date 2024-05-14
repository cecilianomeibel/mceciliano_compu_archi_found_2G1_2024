module ControladorMotor_tb();

    // Parámetros
    logic [3:0] A_num_tb;
    logic [3:0] B_num_tb;
    logic [1:0] ALUControl_tb;
    logic clk_tb;
    logic rst_tb;
    
    // Señales de salida
    logic [3:0] result_tb;
    logic V_flag_tb, C_flag_tb, N_flag_tb, Z_flag_tb;
    logic speed_motor_tb;
    logic [6:0] seg_tb;
    
    // Instanciar el módulo bajo prueba
    ControladorMotor dut (
        .A_num(A_num_tb),
        .B_num(B_num_tb),
        .ALUControl(ALUControl_tb),
        .clk(clk_tb),
        .rst(rst_tb),
        .result(result_tb),
        .V_flag(V_flag_tb),
        .C_flag(C_flag_tb),
        .N_flag(N_flag_tb),
        .Z_flag(Z_flag_tb),
        .speed_motor(speed_motor_tb),
        .seg(seg_tb)
    );
    
    // Generar un clock para la simulación
    initial begin
		 clk_tb = 0;
		 forever #1 clk_tb = ~clk_tb;
	 end
    
	 
    // Inicialización de señales
    initial begin
        // Asignar valores iniciales a las entradas
        rst_tb = 0;
		  #5;
		  rst_tb = 1;
		  A_num_tb = 4'b0000;
        B_num_tb = 4'b0000;
        ALUControl_tb = 2'b00;   
		  
        // Esperar un ciclo para permitir la inicialización del módulo
        #100;
        // Simular una secuencia de operaciones
        
        // Test 1: Suma
        A_num_tb = 4'b0010;
        B_num_tb = 4'b0011;
        ALUControl_tb = 2'b00; // Suma
		  
        #1024;
        
        // Test 2: Resta
        A_num_tb = 4'b0100;
        B_num_tb = 4'b0010;
        ALUControl_tb = 2'b01; // Resta
        #1024;
        
        // Test 3: AND
        A_num_tb = 4'b0010;
        B_num_tb = 4'b0001;
        ALUControl_tb = 2'b10; // AND
        #1024;
        
        // Test 4: OR
        A_num_tb = 4'b0110;
        B_num_tb = 4'b0011;
        ALUControl_tb = 2'b11; // OR
        #1024;     
        
        // Finalizar la simulación
        $finish;
    end
    
endmodule
