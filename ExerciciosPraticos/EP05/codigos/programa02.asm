# Programa 02 (add, addi, sub, logicas)

# {
#    x = 1;
#    y = 5*x + 15;
# }

# Associacoes
# x -> $s0
# y -> $s1

# inicio
.text
.globl main

main:
   ori  $s0, $zero, 0x0001   # x = 1
   add  $t0, $s0, $s0        # t0 = 2*x 
   add  $t0, $t0, $t0        # t0 = 4*x
   add  $t0, $t0, $s0        # t0 = 5*x
   addi $s1, $t0, 0x000F     # y = 5*x + 15
# fim




