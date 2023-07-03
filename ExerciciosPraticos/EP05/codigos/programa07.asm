# Programa 07 (reg-reg logicas e/ou instrucoes de deslocamento (sll, srl e sra))

# {
#    ori $8, $0, 0x01
#    ...
#    $8 = 0xFFFFFFFF
# }

# Associacoes

# inicio
.text
.globl main

main:
   ori $8, $0, 0x0001     # s8 = 0x 0000 0001
   sll $8, $8, 0x001F     # s8 = 0x 8000 0000  // s8 = 1000 ... 0000
   sra $8, $8, 0x001F     # s8 = 0x FFFF FFFF  // s8 = 1111 ... 1111
# fim

