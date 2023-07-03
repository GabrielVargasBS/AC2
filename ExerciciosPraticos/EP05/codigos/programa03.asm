# Programa 03 (add, addi, sub, logicas)

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
   ori $s0, $zero, 0x0003   # x = 3
   ori $s1, $zero, 0x0004   # y = 4
   add $t0, $s0, $s0        # t0 = 2*x
   add $t0, $t0, $t0        # t0 = 4*x
   add $t0, $t0, $t0        # t0 = 8*x
   add $t0, $t0, $t0        # t0 = 16*x
   sub $t0, $t0, $s0        # t0 = 15*x
   add $t1, $s1, $s1        # t1 = 2*y
   add $t1, $t1, $t1        # t1 = 4*y
   add $t1, $t1, $t1        # t2 = 8*y
   add $t1, $t1, $t1        # t2 = 16*y
   add $t1, $t1, $t1        # t2 = 32*y
   add $t1, $t1, $t1        # t2 = 64*y
   add $t1, $t1, $s1        # t2 = 65*y
   add $t1, $t1, $s1        # t2 = 66*y
   add $t1, $t1, $s1        # t2 = 67*y
   add $t0, $t0, $t1        # t0 = 15*x + 67*y
   add $t0, $t0, $t0        # t0 = 2*(15*x + 67*y)
   add $s2, $t0, $t0        # z = 4*(15*x + 67*y)
# fim





