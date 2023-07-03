# Programa 15 (beq, bne, j)

# {
#    int vetor[100];
#    int soma = 0;
#    for(int i = 0; i < 100; i++) {
#       vetor[i] = 2*i + 1;   // MEM[i] = 2*i + 1;
#       soma += 2*i + 1;
#    }
#    MEM[100] = soma;
# }

# Associacoes
# vetor[0] -> $s0
# soma -> $s1
# i -> $s2

# inicio
.text
.globl main

main:
   lui  $s0, 0x1001         # x = 0x 1001 0000
   or   $s1, $0, $0         # soma = 0
   or   $s2, $0, $0         # i = 0
   ori  $t3, $0, 0x0064     # t3 = 100
   
loop: 
   sll  $t1, $s2, 0x0001    # t1 = 2*i
   addi $t1, $t1, 0x0001    # t1 = 2*i + 1
   sll  $t2, $s2, 0x0002    # t2 = 4*i
   add  $t2, $s0, $t2       # t2 = &vetor[i]
   sw   $t1, 0x0000($t2)    # MEM[i] = 2*i + 1
   add  $s1, $s1, $t1       # soma = soma + 2*i + 1
   addi $s2, $s2, 0x0001    # i = i + 1
   bne  $s2, $t3, loop      # if(i < 100) loop
   sw   $s1, 0x0004($t2)    # MEM[100] = soma

.data
# fim





