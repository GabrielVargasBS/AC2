# Programa 21

# {
#    x = MEM[0];
#    if(x > 0) y = x^3 + 1;
#    else y = x^4 - 1;
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
   beq  $s0, $0, y2         # if(x == 0) y2
   srl  $t2, $s0, 0x001F    # t2 = 0x 0000 000?    // ? = 0 se x > 0; ? = 1 se x < 0
   beq  $t2, $0, y1         # if(x > 0) y1

y2:
   mult $s0, $s0            # hi lo = x^2
   mflo $t1                 # t1 = x^2
   mult $t1, $t1            # hi lo = x^4
   mflo $t1                 # t1 = x^4
   sub $s1, $t1, 0x0001     # y = x^4-1
   j store                  # go to store

y1: 
   mult $s0, $s0            # hi lo = x^2
   mflo $t1                 # t1 = x^2
   mult $t1, $s0            # hi lo = x^3
   mflo $t1                 # t1 = x^3
   addi $s1, $t1, 0x0001    # y = x^3+1

store:
   sw   $s1, 0x0004($t0)    # MEM[1] = y

.data
x: -2
# fim


