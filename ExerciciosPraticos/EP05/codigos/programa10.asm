# Programa 10 (lw e sw)

# {
#    y = 127x – 65z + 1;
# }

# Associacoes
# x -> $s0
# y -> $s1
# z -> $s2

# inicio
.text
.globl main

main:
   lui  $t0, 0x1001         # t0 = 0x 1001 0000
   lw   $s0, 0x0000($t0)    # x = MEM[0]
   lw   $s2, 0x0004($t0)    # z = MEM[1]
   sll  $t1, $s0, 0x0007    # t1 = 128*x
   sub  $t1, $t1, $s0       # t1 = 127*x
   sll  $t2, $s2, 0x0006    # t2 = 64*z
   add  $t2, $t2, $s2       # t2 = 65*z
   sub  $t1, $t1, $t2       # t1 = 127x – 65z
   addi $s1 $t1, 0x0001     # y = 127x – 65z + 1
   sw   $s1, 0x0008($t0)    # MEM[2] = 127x – 65z + 1
   
.data
x: .word 5
z: .word 7
y: .word 0                  # esse valor devera ser sobrescrito apos a execucao do programa
# fim


