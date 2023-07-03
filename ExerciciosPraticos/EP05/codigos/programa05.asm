# Programa 05 (sll, srl e sra)

# {
#    x = 100000;    // 0x 0001 86A0
#    y = 200000;    // 0x 0003 0D40
#    z = x + y;
# }

# Associacoes
# x -> $s0
# y -> $s1
# z -> $s2

# inicio
.text
.globl main

main:
   ori $t0, $zero, 0x0001   # t0 = 0x 0000 0001
   sll $t0, $t0, 0x0010     # t0 = 0x 0001 0000
   ori $s0, $t0, 0x86A0     # x = 0x 0001 86A0   // x = 100000
   ori $t1, $zero, 0x0003   # t1 = 0x 0000 0003
   sll $t1, $t1, 0X0010     # t1 = 0x 0003 0000
   ori $s1, $t1, 0x0D40     # y = 0x 0003 86A0   // y = 200000
   add $s2, $s0, $s1        # z = x + y
# fim



