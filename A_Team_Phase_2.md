

# Introduction #
This page consists of release notes of our converter and all operations for floating point standard. It will also include all notes, testing implementations, and serious errors or bugs encountered when working on this project.

---

We are working on finishing representing most numbers in floating point, including NaNs. Currently though we are dealing with issues that are long decimal numbers. We have started creating operations programs to work with our converter. See the Code section below for further notes.

All versions, libraries and examples can be [downloaded here.](https://code.google.com/p/cst-250/source/browse/#hg%2FThe%20A%20Team)

# Project #
## Examples ##
Under examples we will upload certain code that may be useful in helping with implementing IEEE 754.

We have a float checker in java code [here](https://code.google.com/p/cst-250/source/browse/The%20A%20Team/FloatChecker.jar).

## Libraries ##
Libraries to help progress on the Project.

[Array Library](https://code.google.com/p/cst-250/source/browse/The%20A%20Team/libplp_array.asm): (updated 4/2/2013)
> Used to determine the length, find the first index of the array, split when it detects a decimal, check for a negative sign.
[UART Library](https://code.google.com/p/cst-250/source/browse/The%20A%20Team/libplp_uart.asm): (updated 4/2/2013)
> Used to read strings, characters, words, and also write the same to the UART screen. Also has the ability to write multi-words. An added function is the ability to read a string and store it in an array


## Operations ##
We now package the operations in versions. Latest one will always be on top.

**Latest Version**: [Operations 1.77](https://cst-250.googlecode.com/hg/The%20A%20Team/Operations/Updates/Operatiosn%201.77.plp) (updated 4/15/2013)

_Release Notes:_
**v1.77 - (4/15/2013)**
  1. Minor Bug Fixes

**v1.75 - (4/11/2013)**
  1. Added a exception checking asm.
  1. Exceptions are now implemented.
  1. Add exceptions handle invalid operations(NaN or infinity, returns qNaN), Overflow (qNaN returned), and Inexact (Inexact still completes operations).
  1. Subtract exceptions invalid operations(NaN or infinity, returns qNaN), Underflow (qNaN returned), and Inexact (Inexact still completes operations).
  1. Multiply exceptions handle Overflow (qNaN), Underflow (qNaN), and all invalid operations (NaN or infinity, returns qNaN).
  1. sNaNs are handled as infinity (0x7F80 or 0xFF80). Any operations with infinity are treated as NaNs and a NaN will be returned.

**v1.7 - (4/4/2013)**
  1. Multiplication has been implemented.
  1. Minor precision error for multiplication
  1. Previous bugs still prevalent. Currently working on them.

**v1.6 - (4/3/2013)**
  1. Addition and Subtraction fully working barring the below errors.
  1. Signage error. Some negative numbers will convert back to positive.
  1. Minor precision error for Addition and Subtraction.
  1. Minor rounding error.

**v1.3 - (4/2/2013)**
  1. Minor Bug fixes


**v1.2 - (3/30/2013)**
  1. Addition fully working except for the same number
  1. Subtraction also works with every number
  1. Added pre-processing and sub-pre-processing for numbers


**v1.0 - (3/28/2013)**
  1. First stable release with Addition only



## Converter ##
**Latest Version**: [v1.5.1](https://cst-250.googlecode.com/hg/The%20A%20Team/Dec_Float/v1.51.plp) -Date: 4/15/2013


_Release Notes_:

**v1.5.1 - (4/15/2013)**
  1. Upper Bound works correctly
  1. Still needs re-factoring

**v1.5 - (3/28/2013)**
  1. Still needs left upper bounds accuracy
  1. Needs major re-factoring
  1. Added a second register to process numbers between 1 and -1 (decimal numbers). This has allowed us to process more numbers in that range (1 < 0 > -1).
  1. Still needing another register (or two) to process very small numbers.


**v1.4 - (3/23/2013)**
  1. Can now implement decimal numbers up to 9 digits to the right of zero (ex. 0.xxxxxxxxx can be converted properly)
  1. Needs major re-factoring
  1. Needs left upper bounds accuracy


**v1.3 - (3/18/2013)**
  1. Implemented rounding for the mantissa.
  1. All numbers greater than one can be represented in the processing phase.
  1. Numbers that are more than 35 digits long left of the decimal will produce errors for the LSB in the mantissa. Currently working on adding another register to correct this.
  1. Currently working on implementing processing for very small numbers (negative exponent).
  1. Entire code will need Re-factoring.


**v.1.12 - (3/12/2013)**
  1. Started using specific registers for storing sign bit, array length, decimal location, and final float content ($s0, $s1, $s2, and $s6 respectively).
  1. No rounding yet.


**v1.1 - (3/7/2013)**
  1. Can store between -4,294,967,296 and 4,294,967,296.
  1. Cannot store between -1 to 1 currently.
  1. Current issues with LSB since rounding is not implemented yet.
  1. Needs to be inputted as a decimal (without decimal it will not run)
  1. It will detect a negative (sign bit can be changed)



## Next ##
Exceptions implemented, working on Implementing the Flags - (4/11/2013)
Fix rounding issue (if odd, the last 2 bits are off) - (4/11/2013)
