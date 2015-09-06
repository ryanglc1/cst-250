# Meeting Journal Entries #

**_February 17, 2013_**

Priscilla met with Alain at Hayden library. They discussed the project with Sylvia and Richard on Skype.

Went over our ("horrible") presentation and how we can improve on it

Decided that next Thursday, February 21st, we need to cover:

  * more examples and explain conversions

  * do not read slides

  * establish weekly group meetings from this point forward



**_February 18, 2013_**

Priscilla and Sylvia researched more info about IEEE 754 at the Poly library



**_February 26, 2013_**

Found out that we need to take a decimal and convert it into ASCII
It should read in a negative.

  * Came up with different registers to store the digits in (total of 7)

$[r1](https://code.google.com/p/cst-250/source/detail?r=1) - left

$[r2](https://code.google.com/p/cst-250/source/detail?r=2) - right

$[r3](https://code.google.com/p/cst-250/source/detail?r=3) - dividend

$[r4](https://code.google.com/p/cst-250/source/detail?r=4) - converted fraction

$[r5](https://code.google.com/p/cst-250/source/detail?r=5) - convert decmal

$[r6](https://code.google.com/p/cst-250/source/detail?r=6) - exponent

$[r7](https://code.google.com/p/cst-250/source/detail?r=7) - total

Why do we need division?

We need to figure out how to convert right side to binary (using right shifts)

Started thinking of algorithm for converting to binary

Algorithm:

1) Take first character (+ or -), (number or decimal)

2) If it is a number, add 0 and the number

3) Read next number or decimal. If it is a decimal, change it to decimal and store it in the decimal register. Otherwise, take the number and multiply it by 10, then add the number.

4) Convert the decimal to binary.

5) Concatenate the decimal to the whole number.

6) Normalize it to get exponent.

7) We have an exponent register and every time we take a number, add 10 to it.

8) Store it into register.

Pseudocode:

$t1, $zero

$a0, 12.7<-user

$add, $t1, $t1, $a0

Multiply previous digit by 10

read ($a0)

add $t1, $t1, $a0

read 2, $a0

mult $t1, $t1, $10

add $t1, $t1, $a0

if (decimal)

jump out

6.26

if it is to the left of the decimal point, use srl (shift right logical)

if it is to the right of the decimal point, use sll (shift left logical)

0.26\*2=0.52 (truncated to 0)

0.52\*2=1.04 (truncated to 1)

0.04\*2=0.08 (truncated to 0)

0.08\*2=0.16 (truncated to 0)

0.16\*2=0.32 (truncated to 0)

Tasks:

Sylvia - get user input from UART and save it

Richard - binary division and remainder



**_March 5, 2013_**

0.675

Divisor = 1000

We need a divisor for every number, you take in adda 10

Since there is no division, we need to create our own

Suggestions:

Binary long division

Alain's task – read in multiple digits


**_March 13, 2013_**

  * Discussed progress on project on Skype
  * Priscilla completed division part of project, just had compile issues
  * Alain is working on the exponent function. He's having some difficulties with it, but still making some progress. He got it to work for two digits so far.
  * Agreed to share code with everyone so that we could all see how the program runs so far
  * Decided to meet on Tuesday at 5 to put powerpoint together for project presentation on Thursday, March 21st