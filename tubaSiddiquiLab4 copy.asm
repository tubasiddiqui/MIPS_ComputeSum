# Tuba Siddiqui
# Lab 4 CS10
# Description: Compute sum of all odd integers from 1 up 
# a user supplied value
# MAC OSX
# Solution File: tubaSiddiquiLab4.asm
# Date:  10/20/18
# Development Environment:  MARS MIPS Simulator
# Registers used:
# t0 - used to hold user input 
# t1 - used to get odd integers
# t2 - used to add odd integer sums
# a0 - address of string
# v0 - syscall parameter 

    .data
    
  name:   .asciiz "Siddiqui\n"
  id:     .asciiz "20262796\n"
  input:  .asciiz "Enter top value:\n"
  sum:    .asciiz "Sum of odd integers in top value:\n"

    .text
main:             # MARS start execution at main
la $a0, name      # load the addr of name into $a0
li $v0, 4         # 4 is the print_string syscall
syscall           # do the syscall
   
la $a0, id        # load the addr of id into $a0
li $v0, 4         # 4 is the print_string syscall
syscall           # do the syscall
   
la $a0, input     # load the addr of input into $a0
li $v0, 4         # 4 is the print_string syscall
syscall           # do the syscall
   
li $v0, 5         #read and load immediate int from user
syscall           # do the syscall
move $t0, $v0     #store user value in $t0

li $t1, 2         #store 2 in $t1
div $t0, $t1      #divide user input by 2 ($t1)
mfhi $t1          #store remainder in $t1
beq $t1, 1, exit  #if remainder is 1 go to exit
sub $t0, $t0, 1   #else, subtract 1 
 
exit:             #branch here if odd int (rem = 1)
li $t1, 0         #initialize sum
li $t2, 1         #store 1 in $t2 to start computing sum at 1

loop:                #continue adding odd integers until reach top 
bgt $t2, $t0, target #branch to target if $t2 > $t0 
add $t1, $t1, $t2    #add next odd int value to 1 and store in $t1
add $t2, $t2, 2      #continue adding odd, every other int, and store in register
b loop               #branching loop

target:
la $a0, sum         #load the addr of sum into $a0
li $v0, 4           # 4 is the print_string syscall        
syscall             # do the syscall

li $v0, 1
move $a0, $t1       #store & print value of $t1
syscall             #do the syscall

li $v0, 10
syscall             #end syscall
   

