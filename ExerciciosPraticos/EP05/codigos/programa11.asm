# Programa 11 (lw e sw)

# {
#    y = x – z + 300000;
# }

# Associacoes
# x -> $s0
# y -> $s1
# z -> $s2

# inicio
.text
.globl main

main:
   lui $t0, 0x1001         # t0 = 0x 1001 0000
   lw  $s0, 0x0000($t0)    # x = MEM[0]
   lw  $s2, 0x0004($t0)    # z = MEM[1]
   sub $t1, $s0, $s2       # t1 = x - z
   lui $t2, 0x0004         # t2 = 0x 0004 0000
   ori $t2, $t2, 0x93E0    # t2 = 0x 0004 93E0  // 300000
   add $s1, $t1, $t2       # y = x – z + 300000
   sw  $s1, 0x0008($t0)    # MEM[2] = x – z + 300000
   
.data
x: .word 100000
z: .word 200000
y: .word 0       # esse valor devera ser sobrescrito apos a execucao do programa
# fim


