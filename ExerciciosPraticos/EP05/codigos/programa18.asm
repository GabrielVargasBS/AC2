# Programa 18 (beq, bne, j)

# { x = MEM[0];y = MEM[1]; k = pow(x, y); MEM[2] = k; }

# Associacoes: x -> $s0; y -> $;

# inicio
.text
.globl main

main:
   lui  $t0, 0x1001         # t0 = 0x 1001 0000
   lw   $s0, 0x0000($t0)    # x = MEM[0]
   lw   $s1, 0x0004($t0)    # y = MEM[1]
   or   $a0, $0, $s0        # a0 = x
   or   $a1, $0, $s1        # a1 = y
   jal  pow                 # pow(x, y)
   add  $s2, $0, $v0        # resp = pow(x,y)
   sw   $s2, 0x0008($t0)    # MEM[2] = resp
   j    fim                 # go to fim
   
pow:
   addi $t4, $0, 0x0001     # conty = 1
   add  $t5, $0, $a0        # t5 = x
   # Tratar execao
   slt  $t3, $a1, $0       # t3 = 1 if y < 0
   bne  $t3, $0, return    # if(y < 0)  k = -1
   beq  $a1, $0, zero      # if(y == 0) k = 1
   beq  $a1, $t4, um       # if(y == 1) k = x
   
loop:
   add  $t1, $t1, $t5       # t1 = t1 + x
   addi $t2, $t2, 0x0001    # contx = contx + 1
   bne  $t2, $a0, loop      # if(contx != x) loop
   add  $t5, $0, $t1        # t5 = t1 (atual)
   addi $t2, $0, 0x0001     # t2 = t2 + 1
   addi $t4, $t4, 0x0001    # conty = conty + 1
   bne  $t4, $a1, loop      # if(conty != y) loop
   add  $v0, $0, $t5        # k = pow(x,y)
   j return                 # go to store
   
zero: 
   addi $v0, $0, 0x0001     # k = 1
   j return                  # go to store
   
um: 
   add  $v0, $0, $s0        # k = x

return:
   jr  $ra
   
fim:

.data
x: 2
y: 5


