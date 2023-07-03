# Programa 20

# {
#    x = MEM[0];
#    if(x % 2 == 0) y = x^4 + x^3 - 2*x^2;
#    else y = x^5 - x^3 + 1;
#    MEM[1] = y;
# }

# Associacoes
# x -> $s0; y -> $s1

# inicio
.text
.globl main

main:
   lui  $t0, 0x1001         # t0 = 0x 1001 0000
   lw   $s0, 0x0000($t0)    # x = MEM[0]
   andi $t1, $s0, 0x0001    # t1 = 0x0000 000?   // ? = 0 se par; ? = 1 se impar
   beq  $t1, $0,  par       # if(x % 2 == 0) go to par
   mult $s0, $s0            # hi lo = x^2
   mflo $t2                 # t2 = x^2
   mult $t2, $s0            # hi lo = x^3
   mflo $t3                 # t3 = x^3
   mult $t2, $t3            # hi lo = x^5
   mflo $t4                 # t4 = x^5
   sub  $t4, $t4, $t3       # t4 = x^5 - x^3
   addi $s1, $t4, 0x0001    # y = x^5 - x^3 + 1
   j store                  # go to store
   
par:
   mult $s0, $s0            # hi lo = x^2
   mflo $t2                 # t2 = x^2
   mult $t2, $s0            # hi lo = x^3
   mflo $t3                 # t3 = x^3
   mult $t2, $t2            # hi lo = x^4
   mflo $t4                 # t4 = x^4
   add  $t4, $t4, $t3       # t4 = x^4 + x^3
   sub  $t4, $t4, $t2       # t4 = x^4 + x^3 - x^2
   sub  $s1, $t4, $t2       # y = x^4 + x^3 - 2*x^2

store:
   sw   $s1, 0x0004($t0)    # MEM[1] = y

.data
x: 5
# fim


