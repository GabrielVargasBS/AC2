# Programa 13 (beq, bne, j)

# {
#    int A = MEM[0];
#    if (A < 0) A = -A;
#    MEM[0] = A;
# }

# Associacoes
# A -> $s0

# inicio
.text
.globl main

main:
   lui $t0, 0x1001         # x = 0x 1001 0000
   lw  $s0, 0x0000($t0)    # A = MEM[0]
   srl $t1, $s0, 0x001F    # t1 = 0x0000 000?   // ? = 0 se positivo; ? = 1 se negativo
   beq $t1, $0, end        # if (A > 0) end
   sub $s0, $0, $s0        # else A = |A|
   sw $s0, 0($t0)          # MEM[0] = A
   
end:

.data
A: -9

# fim


