.data
N:
.word 5
M:
.word 3

matrix:
.word 1, 1, 1, 1, 1
.word 2, 2, 2, 2, 2
.word 1, 1, 1, 1, 0

result:
.word 2147483647

index:
.word 0

.text

main:
# загрузка аргументов функции в регистры a2-a5
# la - load address
la a2, N
la a3, M
la a4, matrix
la a5, result

# вызов функции
call process

la a2, index
call print
call exit

print:
addi a0, x0, 1 # print_int ecall
lw a1, 0(a2)
ecall
ret

exit:
addi a0, x0, 10
ecall

process:

lw t1, 0(a2) # N # lw - load word
lw t2, 0(a3) # M
lw a6, 0(a5) # загрузка значения result
la a7, index # адрес переменной index

addi t4, x0, 0 # row pointer (i)

init:
addi t5, x0, 0 # result to save
addi t3, x0, 0 # row element number (j)

cycle:
lw t6, 0(a4) # load value from array
addi a4, a4, 4 # increment array pointer
add t5, t5, t6 # count sum
addi t3, t3, 1 # increment j++
blt t3, t1, cycle # branche less than (j < N)
# end of cycle

blt a6, t5, default
sw t4, 0(a7)
addi a6, x0, 0
add a6, x0, t5

default:
addi t4, t4, 1
blt t4, t2, init # branche current row < M
sw a6, 0(a5)
ret     # переход к адресу возврата ra
