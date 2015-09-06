
## Introduction ##

IEEE 754 is the Standard for Floating Point implementation. During Phase 1 The A Team will conduct research into converting into floating point and converting from, basic operations, attributes and rounding,exception handling, and special circumstances.

link: http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4610933


## Basics ##

There are 5 basic formats, but we will be only using one:

Binary format, 32 bits long.

### Overview of Format ###

1) 1-bit sign (S)

2) 8-bit exponent (E)

3) 23-bit mantissa (M)

| (31) |(30)|-|-|-|-|-|-|-|-|(23)|(22)|-|-|-|-|~|-|-|-|-|(0)|
|:-----|:------------------------|:-------------------------|
| Sign |     Exponent            |       Mantissa           |

In order to represent all correct numbers, we must use a bias, which takes the exponent (E) and subtracts the bias (which in this case is 127).

The final equation to convert a general number into floating point standard is:

(-1)<sup>S</sup> x (1.0+M) x 2<sup>(E - bias)</sup>


## Operations ##

  * Arithmetic
    * Addition
    * Subtraction
    * Multiplication
    * Division
    * squareroot (not used)
    * fused muliplyadd (not used)
    * convertfromInt (not used)


## Special Values ##

  1. De-normal Real Numbers
  1. Zero
  1. Infinity
  1. NaN (SNaN/QNaN)

## Exception Handling ##

  1. Overflow
  1. Underflow
  1. Division by zero
  1. Invalid operations
  1. Inexact

More to be added later (Feb 28th 2013)