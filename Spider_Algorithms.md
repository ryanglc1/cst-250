# Algorithms #


# Home #
[Team Spider Home](Team_Spider.md)

# Integer Conversion Algorithm #
  1. Read value
  1. Check for the ascii equivalent to '.'
  1. If true branch to the Fraction Conversion Algorithm
  1. Subtract 0x30 from it to get 0x00-0x09
  1. Multiply previous value by 10
  1. Add previous value and current value and store it in previous value
  1. Repeat

# Fraction Conversion Algorithm #
  * Part 1:
    * read value
    * subtract 0x30 from it to get 0x00-0x09
    * multiply previous value by 10
    * add previous value and current value and store it in previous value
    * check uart status
    * if 0 branch to Part 2
    * Initial max value is 10, multiply max value by 10
    * repeat

  * Part 2:
    * subtract 1 from max value
    * multiply previous value by 2
    * check if previous value > max value
    * set evaluated boolean to either 1 or 0
    * check evaluated boolean
    * if 0 then branch to append
    * if 1 then branch to Part 3
    * if 0 then branch to Append
  * Part 3:
    * add 1 back to the max value
    * subtract the max value from the previous value and store it in the previous value
    * check if the current fraction is 0
    * if true branch to insert
    * if false branch to append

  * Append:
    * shift left 1
    * check if evaluated boolean is 1
    * if true branch to insert
    * add one back to the max value
    * jump back to the check you left off at

  * Insert:
    * add one to the fraction
    * jump back to check you left off at

# Exponent Conversion Algorithm #
  * The exponent is the number of the integer digits - 1
  * Take that value and add 127 and you have your exponent