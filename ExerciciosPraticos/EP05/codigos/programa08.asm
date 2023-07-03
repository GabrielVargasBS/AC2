# Programa 08 (logicas (or, ori, and, andi, xor, xori) e instrucoes de deslocamento (sll, srl e sra))

# {
#    $8 = 0x12345678
#    ... // nao nessa ordem
#    $9  = 0x12
#    $10 = 0x34
#    $11 = 0x56
#    $12 = 0x78
# }

# Associacoes

# inicio
.text
.globl main

main:
   ori  $13, $0,  0x1234    # t5  = 0x 0000 1234
   sll  $13, $13, 0x0010    # t5  = 0x 1234 0000
   ori  $8,  $13, 0x5678    # $8  = 0x 1234 5678
   andi $12, $8,  0x00FF    # $12 = 0x 0000 0078
   srl  $13, $8,  0x0008    # t5  = 0x 0012 3456
   andi $11, $13, 0x00FF    # $11 = 0x 0000 0056
   srl  $13, $8,  0x0010    # t5  = 0x 0000 1234
   andi $10, $13, 0x00FF    # $10 = 0x 0000 0034
   srl  $9,  $8,  0x0018    # $9  = 0x 0000 0012
# fim



