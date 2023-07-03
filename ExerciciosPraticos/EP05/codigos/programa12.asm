# Programa 12 (lw e sw)

# {
#    int ***x;
#    k = MEM [ MEM [ MEM [ x ] ] ];
#    k = 2*k;
#    MEM [ MEM [ MEM [ x ] ] ] = k;
# }

# Associacoes
# x -> $s0
# k -> $s1

# inicio
.text
.globl main

main:
   lui $s0, 0x1001         # x = 0x 1001 0000
   lw  $t0, 0x0000($s0)    # t0 = MEM[x]
   lw  $t1, 0x0000($t0)    # t1 = MEM[ MEM[x] ]
   lw  $s1, 0x0000($t1)    # k = MEM [ MEM[ MEM[x] ] ]
   sll $s1, $s1, 0x0001    # k = 2*k
   sw  $s1, 0x0000($t1)    # MEM [ MEM[ MEM[x] ] ] = 2*k
         
.data
          x: .word 0x10010004
     pont_x: .word 0x10010008
pont_pont_x: .word 20
# fim