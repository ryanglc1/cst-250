# main source file

.org 0x10000000

#######################
# Team MIPSter #
# Floating Point API #
#######################

# Gets and stores a floating point number from the UART...
#  -Stores input as decimal digits
#  -Seperates integer and fractional parts in seperate arrays
#  -stores length of integer and fractional arrays


############################################
#                 SETUP                    #
############################################
li $s0, 0xf0000000 # UART
li $s1, 0x00000000 # position counter 
li $s2, 0x10000100 # left hand array (a)
li $s3, 0x10010000 # right side array (b)
li $s4, 0x00000000 # flag register
li $s5, 0x00000000 # multi-purpose offset register 
############################################

############################################
#    	      PROGRAM                    #
############################################

read_float:
 lw $t0, 4($s0) # load UART status
 andi $t0, $t0, 0x02 # mask for ready-bit
 beq $t0, $zero, isNull
 
 nop
 lw $a0, 8($s0) # read receive buffer
 sw $t0, 0($s0) # clear ready-bit
 beq $a0, $zero, exit # if null then exit
 nop
 andi $a0, $a0, 0x0000000F # mask out m. sig 28 bits
 addiu $s1, $s1, 1 # increment position counter
 li $t0, 0x01 # point flag not set?
 bne $s4, $t0, load_a 
 nop 
 
 sw $a0, 0x10000100($s3) # store byte => (b)
 addiu $s5, $s5, 0x04 # increment offset
 j read_float
 nop
 load_a:
  sw $a0, 0x10010000($s5) # store byte => (a)
  addiu $s5, $s5, 0x04 # increment offset
  li $t0, 0x0E # decimal point code
  beq $a0, $t0, set_flag_point # if "." in RB
  nop
  j read_float
  nop
  set_flag_point:
   ori $s4, $s4 0x00000001
   sw $s1, 0x10000100($s5) # store length of (a)
   li $s1, 0x00000000 # reset position counter
   j read_float
   nop
# end read_RB 

exit:
 # tidy up and prep for next module
 sw $s1, 0x10000100($s3) # store length of (b)
 and $s5, $s5, $zero # clear offset
 and $s1, $s1, $zero # clear counter
 andi $s4, $s4, 0x0000000E # clear point flag
 nop #jump to next module

isNull:
 andi $s4, $s4, 0x01 # mask for point flag
 bne $s4, $zero, exit # point flag was set.. we are done
 nop
 j read_float # otherwise we are still waiting for an input
 nop
 

################# END ######################
############################################
#         REGISTER USAGE SUMMARY           #
############################################
# $s0: UART
# $s1: position counter
# $s2: integer array (a)
# $s3: fractional array (b)
# $s4: flag register
# $s5: multi-purpose offset register 
# $a0: last byte read
############################################
