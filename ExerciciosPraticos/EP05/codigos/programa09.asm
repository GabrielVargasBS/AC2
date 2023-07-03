# Programa 09 (lw e sw)

# {
#    x1 = MEM[0];
#    x2 = MEM[1];
#    x3 = MEM[2];
#    x4 = MEM[3];
#    MEM[4] = x1 + x2 + x3 + x4;
# }

# Associacoes
# x1 -> $s1
# x2 -> $s2
# x3 -> $s3
# x4 -> $s4
# soma -> $s5

# inicio
.text
.globl main

main:
   ori $t0, $0, 0x1001     # t0 = 0x 0000 1001
   sll $t0, $t0, 0x0010    # t0 = 0x 1001 0000
   lw  $s1, 0x0000($t0)    # x1 = MEM[0]
   lw  $s2, 0x0004($t0)    # x2 = MEM[1]
   lw  $s3, 0x0008($t0)    # x2 = MEM[2]
   lw  $s4, 0x000C($t0)    # x2 = MEM[3]
   add $t1, $s1, $s2       # t1 = x1 + x2
   add $t1, $t1, $s3       # t1 = x1 + x2 + x3
   add $s5, $t1, $s4       # soma = x1 + x2 + x3 + x4
   sw  $s5, 0x0010($t0)    # MEM[4] = soma
   
.data
x1: .word 15
x2: .word 25
x3: .word 13
x4: .word 17
soma: .word -1
# fim


