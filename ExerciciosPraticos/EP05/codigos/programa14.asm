# Programa 14 (beq, bne, j)

# {
#    int A = MEM[0];
#    if (A % 2 == 0) MEM[1] = 0;
#    else MEM[1] = 1;
# }

# Associacoes
# A -> $s0

# inicio
.text
.globl main


# SOLUCAO SEM USAR DESVIO
# main:
#   lui  $t0, 0x1001         # x = 0x 1001 0000
#   lw   $s0, 0x0000($t0)    # A = MEM[0]
#   andi $t1, $s0, 0x0001    # t1 = 0x0000 000?   // ? = 0 se par; ? = 1 se impar
#   sw   $s0, 0x0004($t0)    # MEM[0] = t1

main:
   lui  $t0, 0x1001         # x = 0x 1001 0000
   lw   $s0, 0x0000($t0)    # A = MEM[0]
   andi $t1, $s0, 0x0001    # t1 = 0x0000 000?   // ? = 0 se par; ? = 1 se impar
   beq  $t1, $0, par        # if (A % 2 == 0) par
   sw   $t1, 0x0004($t0)    # else MEM[0] = 1
   j    end
   
par: 
   sw   $0, 0x0004($t0)     # MEM[0] = 0
   
end:

.data
A: 4

# fim
