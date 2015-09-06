# Table of Contents #

## Pythogoras ##
### Purpose ###
To perform the Pythogorean Theorum on defined variables.
To have the theorum within a function.

### Code ###
  * li	$a0,	4
  * li	$a1,	3
  * li	$sp,	0x10fffffc
  * call	pythagoras
  * nop
  * li	$a0,	4
  * li	$a1,	5
  * call	pythagoras
  * nop
  * pythagoras:
  * mullo	$a0,	$a0,	$a0
  * mullo	$a1,	$a1,	$a1
  * addu	$v0,	$a0,	$a1
  * return

### Explanation ###
  * li	$sp,	0x10fffffc

This line is only used to initialize the stack variable.
In this program it is used when we use the "call" command.
This is due to the call command adding all variables to a stack before it jumps to the function.

  * li	$a0,	4
  * li	$a1,	3
  * ...
  * li	$a0,	4
  * li	$a1,	5

These lines are used to define the constants that are used in the formula.

  * call	pythagoras
  * nop
  * ...
  * return

As mentioned above, when using the call command it loads all variables into a stack to free up variables for use within the function.  The "nop" is used to prevent pipelining issues where PLP would've loaded the next line, which may have caused problems.  Finally, "return" unloads the stack from before before returning to the line where it was called.

  * mullo	$a0,	$a0,	$a0
  * mullo	$a1,	$a1,	$a1
  * addu	$v0,	$a0,	$a1

This is the Pythogorean Theorum, "A<sup>2</sup> + B<sup>2</sup> = C<sup>2</sup>."  Multiplying "$a0" by itself creates "A<sup>2</sup>."  Multiplying "$a1" by itself creates "B<sup>2</sup>."  Finally, adding the two together creates "C<sup>2</sup>," which is stored in "$v0."

## Square ##
### Purpose ###
Finds the area of the square.

### Code ###
  * li	$sp,	0x10fffffc
  * li	$s0,	2
  * li	$s1,	2
  * move	$a0,	$s0
  * call	square
  * move	$t0,	$v0
  * move	$a1,	$s1
  * call	twoAB
  * move	$t1,	$v0
  * move	$a0,	$s1
  * call	square
  * move	$t2,	$v0
  * addu	$s2,	$t0,	$t1
  * addu	$s2,	$s2,	$t2
  * j	end
  * nop
  * square:
  * mullo	$v0,	$a0,	$a0
  * return
  * twoAB:
  * mullo	$v0,	$a0,	$a1
  * sll	$v0,	$v0,	1
  * return
  * end:

### Explanation ###
A lot of pointless move commands.
A lot of pointless everything.

## Triangle ##
### Purpose ###
To calculate the area of the triangle given the base and height.

### Code ###
  * li	$a0,	5
  * li	$a1,	7
  * jal	findArea
  * nop
  * move	$s0,	$v0
  * li	$a0,	8
  * li	$a1,	17
  * jal	findArea
  * nop
  * move	$s1,	$v0
  * findArea:
  * mullo	$v0,	$a0,	$a1
  * srl	$v0,	$v0,	1
  * jr	$ra
  * nop

### Explanation ###
  * li	$a0,	5
  * li	$a1,	7

These are the set values which we will use to calculate the area with.

  * jal	findArea
  * nop
  * move	$s0,	$v0

Calls the "findArea" function.  "nop" is used to prevent pipelining issues where PLP would've loaded the next line prematurely.  Then, it moves the previous solution - the area of the first triangle - into a separate variable so that we can calculate a 2nd triangle's area and store the answer safely without overwriting our previous answer.

  * li	$a0,	8
  * li	$a1,	17
  * jal	findArea
  * nop
  * move	$s1,	$v0

Repeats the above process but with different variables (a second triangle).

  * findArea:
  * mullo	$v0,	$a0,	$a1
  * srl	$v0,	$v0,	1
  * jr	$ra
  * nop

The "findArea" function.  Multiplies the base by the height.  Then, by shifting right the answer 1 place, it's essentially dividing by two due to the nature of the hex-base.  Finally, it jumps back to the line where it jumped from.

## Project One ##
### Purpose ###
To light up the LEDs of all the switches that are in the "off" position.

### Code ###
  * li	$t1,	0xf0100000
  * li	$t2,	0xf0200000
  * loop:
  * lw 	$s1,	0($t1)
  * nor	$s1,	$s1,	$s1
  * sw	$s1,	0($t2)
  * j 	loop

### Explanation ###
  * li	$t1,	0xf0100000
  * li	$t2,	0xf0200000

Loads the addresses of the switches and the LEDs, respectively.

  * loop:
  * ...
  * j 	loop

Infinite loop where the contents are done indefinitely until the program is terminated.

  * lw 	$s1,	0($t1)
  * nor	$s1,	$s1,	$s1
  * sw	$s1,	0($t2)

First it loads the state of the switches into "$s1."  Then it flips "on" states ("1") to "off" ("0") and vice-versa by passing it through a NOR gate with itself.  Finally, it stores the state into the LEDs.

## Project Two ##
### Purpose ###
To display the numbers 1 through 4 on a seven-segment display.

### Code ###
  * li	$t1,	0xf0a00000
  * li	$s1,	0x00000006
  * li	$s2,	0x0000005b
  * li	$s3,	0x0000004f
  * li	$s4,	0x00000066
  * nor	$s1,	$s1,	$s1
  * nor	$s2,	$s2,	$s2
  * nor	$s3,	$s3,	$s3
  * nor	$s4,	$s4,	$s4
  * loop:
  * sw	$s1,	0($t1)
  * sw	$s2,	0($t1)
  * sw	$s3,	0($t1)
  * sw	$s4,	0($t1)
  * j 	loop

### Explanation ###
  * li	$t1,	0xf0a00000

This loads the address of the seven-segment display into PLP for use.

  * li	$s1,	0x00000006
  * li	$s2,	0x0000005b
  * li	$s3,	0x0000004f
  * li	$s4,	0x00000066

These are the addresses used to create the numbers 1 through 4 on the seven-segment display, respectively.

  * nor	$s1,	$s1,	$s1
  * nor	$s2,	$s2,	$s2
  * nor	$s3,	$s3,	$s3
  * nor	$s4,	$s4,	$s4

By passing the values through a NOR gate with itself, it inverts the value.  This is needed in order to display the number properly on the seven-segment display.

  * loop:
  * ...
  * j 	loop

Infinite loop where the contents are done indefinitely until the program is terminated.

  * sw	$s1,	0($t1)
  * sw	$s2,	0($t1)
  * sw	$s3,	0($t1)
  * sw	$s4,	0($t1)

Finally, it displays the numbers in order from 1 through 4 in the right-most number on the seven-segment display.

## Presentation - Task 01 ##
### Purpose ###
To convert decimal number input into 32-bit single-precision floating point format.

### Code ###
  * start:
  * li	$sp,	0x10fffffc
  * li	$s0,	0x30
  * li	$s1,	0x2e
  * li	$s2,	0x2d
  * li	$s3,	1
  * li	$s4,	10
  * li	$s6,	0
  * li	$a2,	0
  * li	$a1,	10
  * move	$s5,	$zero
  * jal	libplp\_uart\_read
  * nop
  * beq	$v0,	$s2,	negativeCheck
  * nop
  * move	$s2,	$zero
  * push	$s6
  * afterChecks:
  * beq	$v0,	$s1,	noInteger
  * nop
  * integerPart:
  * subu	$s2,	$v0,	$s0
  * mullo	$s6,	$s6,	$s4
  * addu	$s6,	$s2,	$s6
  * lui	$t0,	0xf000
  * lw	$t1,	4($t0)
  * andi	$t1,	$t1,	0x02
  * beq	$t1,	$zero,	numberOfIntBits
  * nop
  * jal	libplp\_uart\_read
  * nop
  * beq	$v0,	$s1,	numberOfIntBits
  * nop
  * j	integerPart
  * nop
  * numberOfIntBits:
  * move	$s2,	$s6
  * numberOfIntBitsLoop:
  * srl	$s6,	$s6,	1
  * addu	$s5,	$s5,	$s3
  * sll	$s7,	$s7,	1
  * addu	$s7,	$s7,	$s3
  * beq	$s6,	$zero,	maskIntValue
  * nop
  * j	numberOfIntBitsLoop
  * nop
  * maskIntValue:
  * subu	$s7,	$s7,	$s3
  * srl	$s7,	$s7,	1
  * and	$s2,	$s2,	$s7
  * push	$s2
  * beq	$t1,	$zero,	noFractionMove
  * nop
  * fractionPart:
  * li	$a0,	23
  * move	$s1,	$s5
  * subu	$s5,	$a0,	$s5
  * move	$s7,	$s5
  * jal	libplp\_uart\_read
  * nop
  * fractionLoop:
  * subu	$s2,	$v0,	$s0
  * mullo	$s6,	$s6,	$s4
  * addu	$s6,	$s2,	$s6
  * lui	$t0,	0xf000
  * lw	$t1,	4($t0)
  * andi	$t1,	$t1,	0x02
  * beq	$t1,	$zero,	calcFraction
  * nop
  * jal	libplp\_uart\_read
  * nop
  * mullo	$a1,	$a1,	$s4
  * j	fractionLoop
  * nop
  * calcFraction:
  * subu	$a1,	$a1,	$s3
  * sll	$s6,	$s6,	1
  * sltu	$t0,	$a1,	$s6
  * subu	$s5,	$s5,	$s3
  * beq	$t0,	$zero,	endOfFunction1
  * nop
  * jal	calcFraction1
  * nop
  * endOfFunction1:
  * bne	$t0,	$zero,	endOfFunction2
  * nop
  * jal	appendValue
  * nop
  * endOfFunction2:
  * bne	$s5,	$zero,	endOfFunction3
  * nop
  * jal	exponent
  * nop
  * endOfFunction3:
  * j	calcFraction
  * nop
  * calcFraction1:
  * addu	$a1,	$a1,	$s3
  * subu	$s6,	$s6,	$a1
  * beq	$a2,	$zero,	insertOne
  * nop
  * bne	$a2,	$zero,	appendValue
  * nop
  * insertOne:
  * addu	$a1,	$a1,	$s3
  * addu	$a2,	$a2,	$s3
  * jr	$ra
  * nop
  * appendValue:
  * sll	$a2,	$a2,	1
  * beq	$t0,	$s3,	insertOne
  * nop
  * addu	$a1,	$a1,	$s3
  * jr	$ra
  * nop
  * negativeCheck:
  * push	$s3
  * jal libplp\_uart\_read
  * nop
  * j afterChecks
  * nop
  * noInteger:
  * move	$s1,	$zero
  * push	$s1
  * move	$s5,	$zero
  * j	fractionPart
  * nop
  * noFractionMove:
  * move	$s1,	$s5
  * li	$a0,	23
  * subu	$s5,	$a0,	$s1
  * move	$s7,	$zero
  * exponent:
  * push	$a2
  * move	$a2,	$zero
  * subu	$s1,	$s1,	$s3
  * addiu	$s1,	$s1,	127
  * shiftExponent:
  * sll	$s1,	$s1,	1
  * subu	$a0,	$a0,	$s3
  * beq	$a0,	$zero,	popTime
  * nop
  * j	shiftExponent
  * nop
  * popTime:
  * pop	$a2
  * pop	$a1
  * pop	$a3
  * bne	$s7,	$zero,	shiftInteger
  * nop
  * li	$a0,	23
  * beq	$a2,	$zero,	shiftIntegerNoFraction
  * nop
  * shiftIntegerNoFraction:
  * subu	$s5,	$s5,	$s3
  * sll	$a1,	$a1,	1
  * beq	$s5,	$zero,	combineIntFrac
  * nop
  * j	shiftIntegerNoFraction
  * nop
  * shiftInteger:
  * subu	$s7,	$s7,	$s3
  * sll	$a1,	$a1,	1
  * beq	$s7,	$zero,	combineIntFrac
  * nop
  * j	shiftInteger
  * nop
  * combineIntFrac:
  * addu	$a1,	$a1,	$a2
  * sll	$a1,	$a1,	1
  * combineExponentMantissa:
  * addu	$a1,	$s1,	$a1
  * li	$s2,	31
  * beq	$a3,	$zero,	combineAll
  * nop
  * shiftSign:
  * sll	$a3,	$a3,	1
  * subu	$s2,	$s2,	$s3
  * beq	$s2,	$zero,	combineAll
  * nop
  * j	shiftSign
  * nop
  * combineAll:
  * addu	$a1,	$a3,	$a1
  * exit:

### Explanation ###
  * start:
  * li	$sp,	0x10fffffc
  * li	$s0,	0x30
  * li	$s1,	0x2e
  * li	$s2,	0x2d
  * li	$s3,	1
  * li	$s4,	10
  * li	$s6,	0
  * li	$a2,	0
  * li	$a1,	10
  * move	$s5,	$zero

Initializes the variables we'll be using in the program.  This includes initializing the stack pointer, several characters that represent ascii characters which we will need when we convert later, and constants used for incrementing/masking the hidden bit/converting between BCD and Hexidecimal numbers.

  * jal	libplp\_uart\_read
  * nop
  * beq	$v0,	$s2,	negativeCheck
  * nop
  * move	$s2,	$zero
  * push	$s6

Reads the input given to UART.  It checks whether there is a negative in front and then clears the dash symbol after recording it is negative.  Finally it pushes "0" as the sign bit for now.

  * beq	$v0,	$s1,	noInteger
  * nop

If there is no integer, it's a pure fraction and has to be dealt with in a different manner.  This checks for that.

  * integerPart:
  * subu	$s2,	$v0,	$s0
  * mullo	$s6,	$s6,	$s4
  * addu	$s6,	$s2,	$s6
  * lui	$t0,	0xf000
  * lw	$t1,	4($t0)
  * andi	$t1,	$t1,	0x02
  * beq	$t1,	$zero,	numberOfIntBits
  * nop
  * jal	libplp\_uart\_read
  * nop
  * beq	$v0,	$s1,	numberOfIntBits
  * nop
  * j	integerPart
  * nop

First, it converts the input into decimal by subtracting 0x30 from the number, multiplying the previous state of the number by 10, and adding the results.  By reading the numbers one by one, we're checking to find the decimal point, at which point we can branch off and store the fractional portion elsewhere.

  * numberOfIntBits:
  * move	$s2,	$s6
  * numberOfIntBitsLoop:
  * srl	$s6,	$s6,	1
  * addu	$s5,	$s5,	$s3
  * sll	$s7,	$s7,	1
  * addu	$s7,	$s7,	$s3
  * beq	$s6,	$zero,	maskIntValue
  * nop
  * j	numberOfIntBitsLoop
  * nop

After storing the integer into $s2 it loops shifting and checking for a value to count how many bits the integer consists of.

  * maskIntValue:
  * subu	$s7,	$s7,	$s3
  * srl	$s7,	$s7,	1
  * and	$s2,	$s2,	$s7
  * push	$s2
  * beq	$t1,	$zero,	noFractionMove
  * nop

By masking the implied bit, this stores the integer portion of the input into a variable without its implied bit which is unneeded.

  * fractionPart:
  * li	$a0,	23
  * move	$s1,	$s5
  * subu	$s5,	$a0,	$s5
  * move	$s7,	$s5
  * jal	libplp\_uart\_read
  * nop

After clearing the decimal point, it calculates how many bits are in the rest of the input (since we've only worked with the integer portion up to the decimal point).

  * fractionLoop:
  * subu	$s2,	$v0,	$s0
  * mullo	$s6,	$s6,	$s4
  * addu	$s6,	$s2,	$s6
  * lui	$t0,	0xf000
  * lw	$t1,	4($t0)
  * andi	$t1,	$t1,	0x02
  * beq	$t1,	$zero,	calcFraction
  * nop
  * jal	libplp\_uart\_read
  * nop
  * mullo	$a1,	$a1,	$s4
  * j	fractionLoop
  * nop

As we did previously, this converts the input into decimal for us to work with.  The difference with this code is that it constantly checks for the "end of the number" before looping rather than the decimal point.

  * calcFraction:
  * subu	$a1,	$a1,	$s3
  * sll	$s6,	$s6,	1
  * sltu	$t0,	$a1,	$s6
  * subu	$s5,	$s5,	$s3
  * beq	$t0,	$zero,	endOfFunction1
  * nop
  * jal	calcFraction1
  * nop

Converts the decimal into floating point by multiplying by two constantly.  The ones place (which results in either "0" or "1") ends up being the floating point representation of that number.

  * endOfFunction1:
  * bne	$t0,	$zero,	endOfFunction2
  * nop
  * jal	appendValue
  * nop
  * endOfFunction2:
  * bne	$s5,	$zero,	endOfFunction3
  * nop
  * jal	exponent
  * nop
  * endOfFunction3:
  * j	calcFraction
  * nop
  * calcFraction1:
  * addu	$a1,	$a1,	$s3
  * subu	$s6,	$s6,	$a1
  * beq	$a2,	$zero,	insertOne
  * nop
  * bne	$a2,	$zero,	appendValue
  * nop

These are the branching functions that, depending on whether the result of calculating the fraction is a "0" or a "1," direct you accordingly.

  * insertOne:
  * addu	$a1,	$a1,	$s3
  * addu	$a2,	$a2,	$s3
  * jr	$ra
  * nop
  * appendValue:
  * sll	$a2,	$a2,	1
  * beq	$t0,	$s3,	insertOne
  * nop
  * addu	$a1,	$a1,	$s3
  * jr	$ra
  * nop

Shifts the variable we are storing the result to between each "0" or "1."  It stores a "0" by default but stores a "1" if needed.

  * negativeCheck:
  * push	$s3
  * jal libplp\_uart\_read
  * nop
  * j afterChecks
  * nop

Pushes our sign bit from earlier into the register.

  * noInteger:
  * move	$s1,	$zero
  * push	$s1
  * move	$s5,	$zero
  * j	fractionPart
  * nop

If the number is a pure fraction, this handles skipping the integer calculations and going straight to the fractional calculations.

  * noFractionMove:
  * move	$s1,	$s5
  * li	$a0,	23
  * subu	$s5,	$a0,	$s1
  * move	$s7,	$zero

Relocates the calculated size for the integer that we calculated earlier as well as does some housekeeping with variables so different functions don't interfere with each other.

  * exponent:
  * push	$a2
  * move	$a2,	$zero
  * subu	$s1,	$s1,	$s3
  * addiu	$s1,	$s1,	127
  * shiftExponent:
  * sll	$s1,	$s1,	1
  * subu	$a0,	$a0,	$s3
  * beq	$a0,	$zero,	popTime
  * nop
  * j	shiftExponent
  * nop

Calculates the exponent of the floating point result by calculating how many places away from the first the decimal point is.

  * popTime:
  * pop	$a2
  * pop	$a1
  * pop	$a3
  * bne	$s7,	$zero,	shiftInteger
  * nop
  * li	$a0,	23
  * beq	$a2,	$zero,	shiftIntegerNoFraction
  * nop

Gets the integer portion, fractional portion, as well as the sign bit on the register for use.

  * shiftIntegerNoFraction:
  * subu	$s5,	$s5,	$s3
  * sll	$a1,	$a1,	1
  * beq	$s5,	$zero,	combineIntFrac
  * nop
  * j	shiftIntegerNoFraction
  * nop
  * shiftInteger:
  * subu	$s7,	$s7,	$s3
  * sll	$a1,	$a1,	1
  * beq	$s7,	$zero,	combineIntFrac
  * nop
  * j	shiftInteger
  * nop
  * combineIntFrac:
  * addu	$a1,	$a1,	$a2
  * sll	$a1,	$a1,	1
  * combineExponentMantissa:
  * addu	$a1,	$s1,	$a1
  * li	$s2,	31
  * beq	$a3,	$zero,	combineAll
  * nop
  * shiftSign:
  * sll	$a3,	$a3,	1
  * subu	$s2,	$s2,	$s3
  * beq	$s2,	$zero,	combineAll
  * nop
  * j	shiftSign
  * nop
  * combineAll:
  * addu	$a1,	$a3,	$a1
  * exit:

Through shifting and combining all the values into one register, we officially get the floating point format for sign-bit, exponent, and mantissa.

## Presentation - Task 02 - Addition ##
### Purpose ###
To perform addition (and subtraction) operations on floating point numbers and receive an accurate output without error.

### Code ###
# main source file

.org 0x10000000

# $a0 = first value
# $a1 = second value
# $a2 = value of 1

# $s0 = first mantissa
# $s1 = second mantissa

# $s2 = first exponent
# $s3 = second exponent

# $s4 = mantissa moved / Becomes counter for # of times mantissa shifted left

# $s5 = first sign / becomes main sign
# $s6 = second sign

# $s7 = final mantissa



#Test Values
li	$a0,	0x00000000
li	$a1,	0x00000000

#For functions needing to use value 1
li	$a2,	1



#1. Make the 24th bit (hidden bit) explicit. If ei = 0, (N; = 0) make it a ‘O’, otherwise make it a ‘1’.
#At this point 33 bits are needed to store the number, 8 for the exponent, 24 for the significand and 1 for the sign.
getMantissa:
li	$t0,	0x007FFFFF		#23 1's
li	$t1,	0x00800000		#1 in the 24th Bit

#First Mantissa
and	$s0,	$a0,	$t0 	#Get Mantissa
addu	$s0,	$s0,	$t1	#Add Implied Bit
#Second Mantissa
and	$s1,	$a1,	$t0 	#Get Mantissa
addu	$s1,	$s1,	$t1	#Add Implied Bit



#2. Compare el and e2. If e2 > el, swap NI and N2.
#Note that if a swap takes place, future references in the flowchart to s1 (el) will be referring to the old s2 (e2) and vice versa.
#Also, the absolute difference in the exponent values (lea-el I) needs to be saved.
getExponent:
li	$t0,	0x7F800000		#Gets the Second to the Nineth Bit

#First Exponent
and	$s2,	$a0,	$t0 	#Get Exponent

#Second Exponent
and	$s3,	$a1,	$t0 	#Get Exponent

compareExponent:
slt	$t0,	$s2,	$s3	#Find if exponent 1 is less than exponent 2
beq	$t0,	$zero,	swap	#If less, swap exponents
nop
j	doNotSwap			#If greater, don't swap exponents
nop

swap:
move	$t0,	$a0
move	$t1,	$s0
move	$t2,	$s2

move	$a0,	$a1
move	$s0,	$s1
move	$s2,	$s3

move	$a1,	$t0
move	$s1,	$t1
move	$s3,	$t2
doNotSwap:



#3. Shift s2 to the right by an amount equal to d= |e2 - el|. Fill the leftmost bits with zeros. Note that both numbers are now in a simple sign/magnitude format.
shiftMantissa:
subu	$s4,	$s2,	$s3

shift\_Mantissa\_Num2\_to\_The\_Right\_Amount\_Equal\_To\_Exp2\_minus\_Exp1:
srl	$s1,	$s1,	1
subu	$s4,	$s4,	$a2	#subtract by 1
bne	$s4,	$zero,	shift\_Mantissa\_Num2\_to\_The\_Right\_Amount\_Equal\_To\_Exp2\_minus\_Exp1
nop



#4. If NI and N2 have different signs, replace 52 by its two’s complement.
getSign:
lui	$t0,	0x8000		#1 in the 32nd Bit

#First Sign
and	$s5,	$a0,	$t0
#Second Sign
and	$s6,	$a1,	$t0

compareSign:
bne	$s4,	$s5,	twosCompliment	#If Different Signs, Replace 2nd Mantissa w/ Two's Compliment
nop
j	noComplimentForYou
nop

twosCompliment:
nor	$s1,	$s1,	$zero	#Invert
addu	$s1,	$s1,	$a2	#adds one
noComplimentForYou:



#5. Compute the significand, S, of the result by adding SI and 52.
addMantissa:
addu	$s7,	$s0,	$s1	#add together



#6. If S is negative, replace it by its two’s complement. For S to be negative, all of the following conditions should be true:
#   	(a) N1 & N2 have different signs.
#	(b) The most significant bit of S is ‘1’.
#	(c) There was no carry-out in step 5.
check\_If\_Mantissa\_Negative:
lui	$t0,	0x8000
slt	$t0,	$s7,	$t0
bne	$t0,	$zero,	twosComplimentAgain
nop
j	noComplimentForYouAgain
nop

twosComplimentAgain:
nor	$s7,	$s7,	$zero	#invert
addu	$s7,	$s7,	$a2	#adds one
noComplimentForYouAgain:


#7. Normalization Step
normalize:
beq	$s5,	$s6,	shift\_Mantissa\_Right\_By\_1	#If Num1 & Num2 have same sign, shift mantissa right by 1 which will drop least significant bit and file most sig with 1
nop
j	create\_Counter	#Else statement
nop

shift\_Mantissa\_Right\_By\_1:
srl	$s7,	$s7,	1

create\_Counter:
li	$s4,	0	#Shift left counter start at 0

#(b) Otherwise, shift mantissa left until there is a ‘1’ in the most significant bit. The number of left shifts must be stored.
shift\_Mantissa\_Left\_Until\_1\_in\_Most\_Sig\_Bit:
lui	$t0,	0x8000
bne	$s7,	$t0,	keep\_shifting\_Mantissa
nop
j	find\_Amount\_of\_Shifts
nop

keep\_shifting\_Mantissa:
sll	$s7,	$s7,	1
addu	$s4,	$s4,	$a2	#Record number of times shifted left
j	shift\_Mantissa\_Left\_Until\_1\_in\_Most\_Sig\_Bit
nop

#(c) If S was shifted left more than 24 times, the result(exponent) is Zero
find\_Amount\_of\_Shifts:
li	$t0,	25
slt	$t1,	$s4,	$t0	#Check if the number of times shifted left is more than 24 times
bne	$t1,	$zero,	finalSign
nop
li	$s2,	0	#If shift is more than 24 times, make the exponent 1 equal to 0



#8. The final sign is going to be the larger of the two numbers (The most significant bit of (the 24-bit wide) Mantissa is replaced with this sign bit.)
finalSign:
slt	$t0,	$a0,	$a1	#if a0 is less than a1, a1 becomes main sign
bne	$t0,	$zero,	finalSignMove
nop

finalSignMove:
move 	$s5,	$s6	#move the sign from second number into the main sign register



#9. The resultant exponent (e1) is adjusted by adding the amount determined in step 7. If it was determined in step 7(c) that S = 0, set the exponent to zero.
finalExponent:
addu	$s2,	$s2,	$s4		#Add counter to exponent 1



#10. Assemble the result into the 32 bit format. Put final value in $v0
finalValue:
# $s5 is the final sign
# $s7 is the final mantissa
# $s2-$s3 are the exponents
addu	$t0,	$s2,	$s3	#Add exponents
addu	$t1,	$s5,	$s7	#Add sign/mantissa
addu	$t0,	$t0,	$t1	#Combine exponents and the sign/mantissa
move	$v0,	$t0

### Explanation ###


## Presentation - Task 02 - Multiplication ##
### Purpose ###
To perform multiplication operations on floating point numbers and receive an accurate output without error.

### Code ###
# floating\_point\_multiplication.plp
# by Christian Murphy

## This program takes two floating point numbers as parameters
# $a0 and $a1 are the paramters
## then calculates the resulting number from floating point multiplication
# using $t variables only within a label
# $s0 to store the sign
# $s1 to store the exponent
# $s2 to store the significand
## Then returns the result
# $v0 is the return register

.org 0x10000000

#testing 1 **1
lui	$a0,	0x3F80
lui	$a1,	0x3F80**

sign:
##exclusive or a0 and a1 for the sign
#mask the sign bit
lui	$t2,	0x8000
and	$t0,	$a0,	$t2
and	$t1,	$a1,	$t2

#exlusive or
or	$t2,	$t0,	$t1
and	$t0,	$t0,	$t1
nor	$t0,	$t0,	$zero
and	$s0,	$t0,	$t2

exponent:
##add exponents and subtract 127 to get new exponent
#mask the exponent
lui	$t2,	0x7F80
and	$t0,	$a0,	$t2
and	$t1,	$a1,	$t2

#add exponents and subtact 127
addu	$s1,	$t0,	$t1
lui	$t2,	0x3F8
subu	$s1,	$s1,	$t2

significand:
##multiply exponents together
#mask the exponent
li	$t1,	0x007FFFFF
and	$t0,	$a0,	$t1
and	$t1,	$a1,	$t1

#add implied bit
lui	$t2,	0x0080
or	$t0,	$t0,	$t2
or	$t1,	$t1,	$t2

#multiply
mulhi	$t2,	$t0,	$t1
mullo	$s2,	$t0,	$t1

normalizeOverflow:
#if there is no overflow skip this step
beq	$t2,	$zero,	normalize
nop
#add one to exponent
lui	$t0,	0x0080
addu	$s1,	$s1,	$t0

#get the lowest bit
andi	$t0,	$t2,	1
sll	$t0,	$t0,	31

#shift significand and overflow
srl	$s2,	$s2,	1
srl	$t2,	$t2,	1

#add new bit to normal significand
or	$s2,	$s2,	$t0
j	normalizeOverflow
nop

normalize:
#when the number is normalized put it together
lui	$t0,	0x0100
sltu	$t0,	$s2,	$t0
bne	$t0,	$zero,	putItTogether
nop

#if it isn't normal shift and add to exponent
srl	$s2,	$s2,	1
lui	$t0,	0x0080
addu	$s1,	$s1,	$t0
j	normalize
nop

putItTogether:
#cut the implied bit
li	$t0,	0x007FFFFF
and	$v0,	$s2,	$s2

#add sign and exponent
or	$v0,	$v0,	$s0
or	$v0,	$v0,	$s1

### Explanation ###