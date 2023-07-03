int Azul = 10;     // Led 10
int Verde = 11;    // Led 11
int Amarelo = 12;  // Led 12
int Vermelho = 13; // Led 13

int Not(int x) {         // Porta not com máscara 0b1111 para obter not lógico
    return (~x & 0b1111);    
}

int An(int a) {          //0
  	return Not(a);
}

int Bn(int b) {          //1
  	return Not(b);
}

int nAeB(int a, int b){  //4
  return (Not(a & b));
}

int nAoB(int a, int b){  //5
  return (Not(a | b));
}

int AxB(int a, int b) {  //6
  	return(a ^ b);
}

int AeBn(int a, int b){  //7
	return (a & Not(b));
}

int AnoB(int a, int b){  //8
  return (Not(a) | (b));
}
    
int nAxB(int a, int b){  //9
  return (Not(a ^ b));
}

int AoB(int a, int b) {  //A
  return(a | b);
}
 
int AeB(int a, int b) {  //B
  return(a & b);
}

int AneB(int a, int b){  //C
  return (Not(a) & (b));
}

int AoBn(int a, int b){  //D
  return (a | Not(b));
}

void setup()
{
	Serial.begin(9600);    // Comunicação Serial
  	pinMode(10, OUTPUT);   // Saída Led 10 (azul)
  	pinMode(11, OUTPUT);   // Saída Led 11 (verde)
  	pinMode(12, OUTPUT);   // Saída Led 12 (amarelo)
  	pinMode(13, OUTPUT);   // Saída Led 13 (vermelho)
}

String memoria[100]; //Memoria
String entrada = ""; 
String ponteiro = "4";
  
int pont = 4;
int qtd_cods = 0;

char x = '0';
char y = '0';
char code = '0';

int a = 0;
int b = 0;

int saida = 0;
String saida_hex = "0";
String output = "0";

void mostrarLed(String output) {
  if (output[0] == '1') {
  	digitalWrite(Vermelho,HIGH);
  } else {
  	digitalWrite(Vermelho,LOW);
  }
  
  if (output[1] == '1') {
  	digitalWrite(Amarelo,HIGH);
  } else {
  	digitalWrite(Amarelo,LOW);
  }
  
  if (output[2] == '1'){
  	digitalWrite(Verde,HIGH);
  } else {
  	digitalWrite(Verde,LOW);
  }
  
  if (output[3] == '1'){
  	digitalWrite(Azul,HIGH);
  } else {
  	digitalWrite(Azul,LOW);
  }
}

void mostrarMemoria() {
    Serial.print("->|");
    for(int i = 0; i < qtd_cods + 4;i++){
        Serial.print(memoria[i]+"|");
    }
    Serial.print("\n");
}

int hexToInt (char hexChar) {
  int hexInt;
  if(isdigit(hexChar)) {
     hexInt = hexChar - '0';
  } else {
     hexInt = hexChar - '0' - 7;
  }
  return hexInt;
}

void loop()
{
    if (Serial.available()){
	entrada = Serial.readString(); // Leitura da entrada do usuário
        qtd_cods = entrada.length()/4 + 1; // Calcula a quantidade de códigos presentes na entrada
      
        // Testar se ultrapassa memoria
        if (qtd_cods > 96) {
            qtd_cods = 96;
        }
      
      	// Inicializa a Memoria 
        memoria[0] = ponteiro;
        memoria[1] = "0";
        memoria[2] = "0";
        memoria[3] = "0";

        int inferior = 0; 
        int superior = 3;
        for (int j = 4; j < qtd_cods + 4; j++){
            memoria[j] = entrada.substring(inferior,superior);
            inferior += 4;
            superior += 4;
       	}
      
        // Mostrar memória após carga inicial
        mostrarMemoria();
        delay(2000);
       	
      	// Loop que percorre o vetor memória armazenando as instruções
      	for(int j = 4; j < qtd_cods + 4; j++){

            x    = memoria[j][0]; // Pega o valor de x da instrução sendo executada
            y    = memoria[j][1]; // Pega o valor de y da instrução sendo executada
            code = memoria[j][2]; // Pega o valor da instrução sendo executada
            
            // Converter valores para hexadecimal
            a = hexToInt(x);
            b = hexToInt(y);
               
          /* Execução das instruções */
          switch(code){
            case '0':
            	saida = An(a);
            	break;
            case '1':
            	saida = Bn(b);
            	break;
            case '2':
            	saida = 0b1111;
            	break;
            case '3':
            	saida = 0b0000;
            	break;
            case '4':
            	saida = nAeB(a,b);
            	break;
            case '5':
            	saida = nAoB(a,b);
            	break;
            case '6':
            	saida = AxB(a,b);
            	break;
            case '7':
            	saida = AeBn(a,b);
            	break;
            case '8':
            	saida = AnoB(a,b);
            	break;
            case '9':
            	saida = nAxB(a,b);
            	break;
            case 'A':
            	saida = AoB(a,b);
            	break;
            case 'B':
            	saida = AeB(a,b);
            	break;
            case 'C':
            	saida = AneB(a,b);
            	break;
            case 'D':
            	saida = AoBn (a,b);
            	break;
            case 'E':
            	saida = b;
            	break;
            case 'F':
            	saida = a;
            	break;
          }

          // Formatar saída em hexadecimal
          saida_hex = String(saida,HEX);
          saida_hex.toUpperCase();
          
          // Formatar output em 4 bits para acender os Leds
          output = String(saida, BIN);
          char output_aux[5];
          sprintf(output_aux, "%04s", output.c_str());
          output = String(output_aux);

          // Reposicionar ponteiro
          ponteiro = String(pont+1);
          pont++;

          // Atribuição dos novos valores ao vetor memória
          memoria[0] = ponteiro;
          memoria[1] = saida_hex;
          memoria[2] = x;
          memoria[3] = y;
          
          // Mostrar resultados
          mostrarLed(output);
          mostrarMemoria();
          delay(2000);
        }
       
    }
}
