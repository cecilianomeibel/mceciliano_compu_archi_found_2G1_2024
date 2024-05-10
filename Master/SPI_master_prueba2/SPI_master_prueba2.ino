
#include <string.h>

int CS = 10;
int mosi = 11;
int miso = 12;
int clk_arduino = 13;
int estado = 1;
int contador_bits = 3;
int estado_envio_datos = 1;


byte operando1_bin;
byte operando2_bin;
byte operador_bin;


bool clk = 0;
bool handShake_confirmation = false;
bool datos_enviados = false;


void setup() {
  Serial.begin(9600);
  pinMode(CS, OUTPUT);
  pinMode(mosi, OUTPUT);
  pinMode(miso, INPUT);
  pinMode(clk_arduino, OUTPUT);
  digitalWrite(mosi, LOW);
  digitalWrite(CS,HIGH); // trasmisión de datos desactivada con el esclavo
  digitalWrite(clk_arduino,LOW);

}

void loop() {
  clk_variator();
  obtener_datos();
  verificar_handShake();

  delay(1000);
}

void clk_variator(){

  clk = !clk;
  digitalWrite(clk_arduino, clk);

}

void verificar_handShake(){
  if(clk && handShake_confirmation == 0){
    digitalWrite(CS,LOW);
    digitalWrite(mosi, HIGH);
    handShake_confirmation = digitalRead(miso);
    if (handShake_confirmation){
        Serial.println("Reconocimiento verificado: se ha establecido conexión");
        Serial.println("En proceso de enviar datos");
        digitalWrite(CS,HIGH);
        digitalWrite(mosi, LOW); // no afecta
    }
  }
}

// como la maquina de estados
void obtener_datos(){ 

  if(handShake_confirmation && clk){
    switch (estado) {
      case 1:
          Serial.print("Ingrese el primer operando: ");
          operando1_bin = ingresar_operadores();
          Serial.println("");
          estado++;
        break;

      case 2:
          Serial.print("Ingrese el segundo operando: ");
          operando2_bin = ingresar_operadores();
          Serial.println("");
          estado++;
        break;

      case 3:
          Serial.print("Ingrese el operador o la operación: ");
          operador_bin = ingresar_operador();
          Serial.println("");
          estado++;
        break;
      case 4:
          if(!datos_enviados){
            digitalWrite(CS,LOW); // se activa la transmisión de datos con el esclavo
            enviar_datos();
           
          }
          else{
            digitalWrite(CS,HIGH); //Se desactiva la transmisión de datos con el esclavo
            estado = 1;
            datos_enviados = false;
          }
        break;
    }
  }
}

byte ingresar_operadores(){
  int numero_ingresado;
  byte numero_bin = 0b0000;
  numero_ingresado = Serial.parseInt();

  while (numero_ingresado < 0 && numero_ingresado > 15) {
    if(numero_ingresado < 0 && numero_ingresado > 15){
      Serial.println("");
      Serial.print("Ingrese un valor valido: ");
      numero_ingresado = Serial.parseInt();
    }
  }
  numero_bin |= (numero_ingresado & 0x0F);

  return numero_bin;
}

byte ingresar_operador(){
  int operador_ingresado;
  byte operador_bin = 0b0000;
  
  while (operador_ingresado < 0 || operador_ingresado > 3) {
    operador_ingresado = Serial.parseInt();
    if(operador_ingresado < 0 && operador_ingresado > 15){
      Serial.println("");
      Serial.print("Ingrese una opción valida: ");
      operador_ingresado = Serial.parseInt();
    }
  }

  switch(operador_ingresado){
    case 0: // Suma
        operador_bin = 0b0000;
      break;
    case 1: // Resta
        operador_bin = 0b0001;
      break;
    case 2: // AND
        operador_bin = 0b0010;
      break;
    case 3: // OR
        operador_bin = 0b0011;
      break;
  }

  return operador_bin;
}

void enviar_datos(){

    switch(estado_envio_datos){
    case 1: // envio bits operando 1

        if(contador_bits > 0){
          digitalWrite(mosi, bitRead(operando1_bin,contador_bits));
          contador_bits--;
        }
        else{
          digitalWrite(mosi, bitRead(operando1_bin,contador_bits));
          estado_envio_datos++;
          contador_bits = 3;
        }
      break;
    case 2: // envio bits operando 2
        if(contador_bits > 0){
          digitalWrite(mosi, bitRead(operando2_bin,contador_bits));
          contador_bits--;
        }
        else{
          digitalWrite(mosi, bitRead(operando2_bin,contador_bits));
          estado_envio_datos++;
          contador_bits = 3;
        }
      break;
    case 3: // // envio bits operador
        if(contador_bits > 0){
          digitalWrite(mosi, bitRead(operador_bin,contador_bits));
          contador_bits--;
        }
        else{
          digitalWrite(mosi, bitRead(operador_bin,contador_bits));
          estado_envio_datos = 1;
          contador_bits = 3;
          datos_enviados = true; 
        }
      break;
  }
}


