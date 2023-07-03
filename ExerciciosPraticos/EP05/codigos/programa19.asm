# Programa 19

# {
#    x = MEM[0];
#    y = MEM[1];
#    t0 = bitsSignificantes de x
#    t1 = bitsSignificantes de y
#    if (t0 + t1 < 32) s2 = x*y
#    else s2, s3 = x*y
# }

# Associacoes
# x -> $s0
# y -> $s1

# inicio
.text
.globl main

main:
   lui  $t0, 0x1001         # t0 = 0x 1001 0000
   lw   $s0, 0x0000($t0)    # x = MEM[0]
   lw   $s1, 0x0004($t0)    # y = MEM[1]
   and  $t0, $t0, $0        # t0 = 0
   lui  $t3, 0xFFFF         # t3 = 0x FFFF 0000
   ori  $t3, $t3, 0xFFFF    # t3 = 0x FFFF FFFF
   srl  $t4, $s0, 0x001F    # t4 = 0x 0000 000?    // ? = 0 se x >= 0; ? = 1 se x < 0
   add  $t2, $zero, $s0     # t2 = x
   beq  $t4, $0, positivo1  # if (x % 2 == 0) positivo1
   j    negativo1           # else negativo1
   
continue1:
   srl  $t4, $s1, 0x001F    # t4 = 0x 0000 000?    // ? = 0 se y >= 0; ? = 1 se y < 0
   add  $t2, $zero, $s1     # t2 = y
   beq  $t2, $0, positivo2  # if (y % 2 == 0) positivo2
   j    negativo2           # else negativo2

continue2:
   mult $s0, $s1            # hi lo = x * y
   add  $t0, $t0, $t1       # contTotal = contx + conty
   addi $t3, $0, 0x0020     # t3 = 32
   slt  $t0, $t0, $t3       # if (contTotal < 32) t0 = 1; else t0 = 0
   beq  $t0, $0, high       # if (t0 == 0) high
   j low                    # else low

positivo1:
  loop1: 
     sra  $t2, $t2, 0x0001 # t2 = t2 >> 1
     addi $t0, $t0, 0x0001 # contx = contx + 1
     bne  $t2, $0, loop1   # if(t2 != 0) loop1
     #sub  $t0, $t3, $t0    # contx = 32 - contx
     j continue1           # go to continue1
     
negativo1:
  loop2: 
     sra  $t2, $t2, 0x0001 # t2 = t2 >> 1
     addi $t0, $t0, 0x0001 # contx = contx + 1
     bne  $t2, $t3, loop2  # if(t2 != 1) loop2
    # sub  $t0, $t3, $t0    # contx = 32 - contx
     j continue1           # go to continue1

positivo2:
  loop3: 
     sra  $t2, $t2, 0x0001 # t2 = t2 >> 1
     addi $t1, $t1, 0x0001 # conty = conty + 1
     beq  $t2, $0, loop3   # if(t2 != 0) loop3
    # sub  $t1, $t3, $t1    # conty = 32 - conty
     j continue2           # go to continue2
     
negativo2:
  loop4: 
     sra  $t2, $t2, 0x0001 # t2 = t2 >> 1
     addi $t1, $t1, 0x0001 # conty = conty + 1
     bne  $t2, $t3,loop4   # if(t2 != 1) loop4
   #  sub  $t1, $t3, $t1    # conty = 32 - conty
     j continue2           # go to continue2
     
high:
   mfhi $s3                # s3 = hi(x*y)
   
low:
   mflo $s2                # s2 = lo(x*y)

.data
x: 75
y: -11
# fim







