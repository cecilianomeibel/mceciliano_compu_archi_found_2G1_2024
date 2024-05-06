module orGate_tb;

//Definir señales 

logic [3:0] a;
logic [3:0] b;
logic [3:0] result;

// Instancia del módulo bajo prueba
  orGate dut (
      .a(a),
      .b(b),
      .result(result)
  );
  

  // Inicialización de señales
  initial begin
      // Establecer valores de entrada
      a = 4'b1110;
      b = 4'b0100;
      #10; 

      // Establecer nuevos valores de entrada
      a = 4'b1111;
      b = 4'b1010;
      #10; // Esperar un tiempo para la propagación
  end

endmodule
