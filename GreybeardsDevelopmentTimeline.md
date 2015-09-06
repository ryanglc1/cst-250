# Introduction #

In the Spring of 2013, our team was given the assignment to implement the IEEE 754 (Floating Point) standard in the PLP.

Note: A horizontal line means a different meeting but during the same week


# Timeline #
### Week 11 (April 20 - April 28) ###

  * Continued work on redoing the entire UART read.
  * We now cover an integer that is up to 37 digits long.

---

  * Began work on the fractional part of UART Read

### Week 10 (April 14 - April 19) ###
  * Attempted to restart part 1 from scratch (reading in floating point numbers and storing them correctly)
  * Began addressing the problem of storing numbers in multiple registers or a number that is larger than the 23 bits. (see meeting notes for this week for more information)

---

  * Continued work on exception handling, beginning with overflow and underflow for multiplication.
  * Discovered that multiplication is off by 1-hex value for really small numbers
  * We have decided that we are going to use 1 register to hold the flags for all exceptions
| **Bit Position** | **Exception** |
|:-----------------|:--------------|
| 0                | Inexact       |
| 1                | Overflow      |
| 2                | Underflow     |
| 3                | Invalid Operation |
  * All exceptions except for inexact have been accounted for for multiplication and are in the team repository in the multiplication plp file.
  * The inexact exception is now properly handled in addition and subtraction.

---

  * Began testing on multiply error handling
    * Overflow works correctly
    * We found an error in our logic for infinity
    * All of the exceptions work for multiplication
  * Worked on the exceptions for addition/subtraction and those are all now functioning correctly.
  * Discuss logic for decimal part for UART Read

### Week 9 (April 8 - April 13) ###
  * Began work on Exception Handling for multiplication
    * 0 and -0 are handled correctly
    * infinity and -infinity are handled correctly
    * Began work on overflow

### Week 8 (April 1 - April 7) ###
  * Continued development on add/sub/multiply
    * Add/Sub
      * Work on shift\_mantissa
      * Found that we're going to need to implement some handling if the exponent becomes bigger than the maximum possible. (overflow)
      * Now correctly gets the exponent and combines the results into the final answer
      * Two positive numbers can now be added
      * Two negative numbers can now be added
    * Multiply
      * Began development


### Week 7 (March 25 - March 31) ###
  * Began development on arthmetic operations (add, subtract, multiply)
    * Add/Sub
      * We store the operation in $t9 depending on inputted sign
      * Find the difference in exponents to see how much you need to shift the mantissas
      * See addsub.plp in Team Greybeards section of the repo
      * Created a spreadsheet to track register usages in addsub.plp (see repo)
      * Here is a picture of our algorithm ![http://i.imgur.com/4CWqpgw.jpg](http://i.imgur.com/4CWqpgw.jpg)

### Week 6 (March 18 - March 24) ###
  * Various presentation preparations (flowchart, powerpoint, etc)
### Week 5 (March 11 - March 17 ###
  * Various presentation preparations (flowchart, powerpoint, etc)
### Week 4 (March 4 - March 10) ###
  * 

### Week 3 (February 25 - March 3) ###
  * Added ability to have an inputted decimal that is less than 1
  * Added logic to shift the negative bits
  * Added logic to shift exponent bits
  * Removed multiplication function, replaced with multiplication operation

### Week 2 (February 18 - February 24) ###
  * Base 10 decimal -> Binary conversion works, with the correct bit count
  * Documents added to team repo to explain register usage and program logic

### Week 1 (February 11 - February 17) ###
  * Build errors fixed
  * The program can now count how many bits and integer takes to represent it
  * Comments were added to existed code
  * The ability to store integers is implemented.
  * The left and right side of an inputted decimal is able to be stored, along with how many digits are in the number total

### The Beginning ###
February 12, 2013
Development commenced.  The bare skeleton of our floatingpoint.plp file was added to the team repository.