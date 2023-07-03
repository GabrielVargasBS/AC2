# Programa 04 (sll, srl e sra)

# {
#    x = 3;
#    y = 4;
#    z = (15*x + 67*y)*4;
# }

# Associacoes
# x -> $s0
# y -> $s1
# z -> $s2

# inicio
.text
.globl main

main:
   ori  $s0, $zero, 0x0003   # x = 3
   ori  $s1, $zero, 0x0004   # y = 4  
   sll  $t0, $s0, 0x0004     # t0 = 16*x
   sub  $t0, $t0, $s0        # t0 = 15*x
   sll  $t1, $s1, 0x0006     # t1 = 64*y
   add  $t1, $t1, $s1        # t1 = 65*y
   add  $t1, $t1, $s1        # t1 = 66*y
   add  $t1, $t1, $s1        # t1 = 67*y
   add  $t0, $t0, $t1        # t0 = 15*x + 67*y
   sll  $s2, $t0, 0x0002     # z = (15*x + 67*y)*4
# fim



