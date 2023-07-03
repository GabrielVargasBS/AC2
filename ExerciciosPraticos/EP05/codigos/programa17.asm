# Programa 17 (beq, bne, j)

# {
#    x = MEM[0];
#    y = MEM[1];
#    k = x * y
#    MEM[2] = k;
# }

# Associacoes
# x -> $s0
# y -> $s1
# k -> $s2

# inicio
.text
.globl main

main:
   lui  $t0, 0x1001         # t0 = 0x 1001 0000
   lw   $s0, 0x0000($t0)    # x = MEM[0]
   lw   $s1, 0x0004($t0)    # y = MEM[1]
     
multi:
   add  $t1, $t1, $s0       # t1 = t1 + x
   addi $t2, $t2, 0x0001    # cont = cont + 1
   bne  $t2, $s1, multi     # if(cont != y) multi

   add  $s2, $0, $t1        # k = x*y
   sw   $s2, 0x0008($t0)    # MEM[2] = k

.data
x: 7
y: 5
# fim


