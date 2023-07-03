# Programa 06 (sll, srl e sra)

# {
#    x = o maior inteiro possivel;
#    y = 300000;   //0004 93E0
#    z = x - 4y
# }

# Associacoes
# x -> $s0
# y -> $s1
# z -> $s2

# inicio
.text
.globl main

main:
   ori $t0, $zero, 0x7FFF   # t0 = 0x 0000 7FFF
   sll $t0, $t0, 0x0010     # t0 = 0x 7FFF 0000
   ori $s0, $t0, 0xFFFF     # x = 0x 7FFF FFFF   // x = 2147483647
   ori $t0, $zero, 0x0004   # t0 = 0x 0000 0004
   sll $t0, $t0, 0X0010     # t0 = 0x 0004 0000
   ori $s1, $t0, 0x93E0     # y = 0x 0004 93E0   // y = 300000
   sll $t0, $s1, 0x0002     # t0 = 4*y
   sub $s2, $s0, $t0        # z = x - 4*y
# fim


