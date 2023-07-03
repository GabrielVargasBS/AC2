import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

class TesteUla {
    
    private static char x;
    private static char y;
    private static char op;

    private static final String arquivoUla = "testeula.ula";
    private static final String arquivoHex = "testeula.hex";

    public static void lerX (String instrucao) {
        if (instrucao.length()==4) { // numero de um digito
            x = instrucao.charAt(2);
        } else { // numero de dois digitos
            switch(instrucao.substring(2,4)) {
                case "10": x = 'A'; break;
                case "11": x = 'B'; break;
                case "12": x = 'C'; break;
                case "13": x = 'D'; break;
                case "14": x = 'E'; break;
                case "15": x = 'F'; break;
            }
        }
    }

    public static void lerY (String instrucao) {
        if (instrucao.length()==4) { // numero de um digito 
            y = instrucao.charAt(2);
        } else {
            switch(instrucao.substring(2,4)) { // numero de dois digitos
                case "10": y = 'A'; break;
                case "11": y = 'B'; break;
                case "12": y = 'C'; break;
                case "13": y = 'D'; break;
                case "14": y = 'E'; break;
                case "15": y = 'F'; break;
            }
        }
    }

    public static void lerOP (String instrucao) {
        // separa operacao depois do = ate antes do ;
        String operacao = instrucao.substring(2,instrucao.length()-1);

        switch (operacao) {
            case "An":     op = '0'; break;
            case "Bn":     op = '1'; break;
            case "umL":    op = '2'; break;
            case "zeroL":  op = '3'; break;
            case "nAeB":   op = '4'; break;
            case "nAoB":   op = '5'; break;
            case "AxB":    op = '6'; break;
            case "AeBn":   op = '7'; break;
            case "AnoB":   op = '8'; break;
            case "nAxB":   op = '9'; break;
            case "AoB":    op = 'A'; break;
            case "AeB":    op = 'B'; break;
            case "AneB":   op = 'C'; break;
            case "AoBn":   op = 'D'; break;
            case "copiaB": op = 'E'; break;
            case "copiaA": op = 'F'; break;
        }
    }

    public static String gerarCodigo() {
        return "" + x + y + op + "\n";
    }

    public static void main (String args[]) throws IOException {
        BufferedReader in = null;
        BufferedWriter out = null;

        try {
            in = new BufferedReader(new FileReader(arquivoUla));
            out = new BufferedWriter(new FileWriter(arquivoHex));

            in.readLine(); // "inicio:"

            String linhaLida = in.readLine();
            
            while (!linhaLida.equals("fim."))  { // comparacao p/terminar pseudocodigo
                boolean mudouOP = false; // indica se a operacao foi alterada ou nao
                char c = linhaLida.charAt(0);

                switch (c) {
                    case 'X': lerX(linhaLida); break;
                    case 'Y': lerY(linhaLida); break;
                    case 'W': lerOP(linhaLida); mudouOP = true; break;
                }
                
                if(mudouOP) // condicao p/escrever codigo no arquivo .hex
                    out.write(gerarCodigo());   
                
                linhaLida = in.readLine();
            }

            in.close();
            out.close();
        } catch (IOException e) {
            System.out.println("\nERRO: ao tentar ler ou escrever em arquivo!\n");
        }
    }

}
