# Programa 16 (beq, bne, j)

# {
#    x = 1600000;    // x = 0x 0018 6A00
#    y =   80000;    // y = 0x 0001 3880
#    z =  400000;    // z = 0x 0006 1A80
#    result = (x*y)/z;
# }

# Associacoes
# x -> $s0
# y -> $s1
# z -> $s2
# result -> $s3

# inicio
.text
.globl main

main:
   lui  $t0, 0x0018         # t0 = 0x 0018 0000
   ori  $s0, $t0, 0x6A00    # x  = 0x 0018 6A00   // x = 1600000
   lui  $t0, 0x0001         # t0 = 0x 0001 0000
   ori  $s1, $t0, 0x3880    # y  = 0x 0001 3880   // y = 80000
   lui  $t0, 0x0006         # t0 = 0x 0006 0000
   ori  $s2, $t0, 0x1A80    # z  = 0x 0006 1A80   // z = 400000
   div  $s0, $s2            # hi = x%z; lo = x/z
   mflo $t0                 # t0 = x/z
   mult $s1, $t0            # hi lo = (x*y)/z
   mflo $s3                 # result = (x*y)/z

.data
# fim





