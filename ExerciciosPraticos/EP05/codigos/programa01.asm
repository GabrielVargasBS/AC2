# Programa 01 (add, addi, sub, logicas)

# {
#    a = 2;
#    b = 3;
#    c = 4;
#    d = 5;
#    x = (a+b) - (c+d); 
#    y = a - b + x;
#    b = x - y;
# }

# Associacoes
# a -> $s0
# b -> $s1
# c -> $s2
# d -> $s3
# x -> $s4
# y -> $s5

# inicio
.text
.globl main

main:
   addi $s0, $zero, 0xffff   # a = -1

# fim





