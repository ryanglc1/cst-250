Progress on our IEEE 754

<a href='https://code.google.com/p/cst-250/wiki/TeamAwesome'>Main Page</a>

**[Team Awesome Journal Two ](Team_Awesome_Operation.md). <-Click here for the latest Update of the Project.
# Introduction #**

Here we will add the journey for the current project of the IEEE 754
Each team member have divided the group the Manual into bits of chapter to the manual

| **Team Member** | **Chapter Assign** |
|:----------------|:-------------------|
|Alejandro Arroyo | 3                  |
|Krish Penumarty  | 8                  |
|Kunaal Godiwala  | 6                  |
|Vance Anderson   | 4                  |
|Alexander Calderon| 5                  |

# IEEE 754 Implementation Phases #

## Phase 0 (complete) ##
-Reading and understanding the standard itself The main focus will be to understand single precision and use information from the standard and research collected elsewhere to come up with algorithms to support subsequent phases.

## Phase 1 (complete) ##
-Have left-of-decimal and right-of-decimal in registers Several steps are involved, but the algorithm we are implementing requires separation of the two sides of a floating point number. The numbers will enter the processor via the UART. The implementation assumes that only digits 0-9 and . are entered (sign-bit will be implemented later) At the end of this phase, the left-side numbers can remain as is, while the right side is still stored as they appear typed in (decimal)

## Phase 2 (complete) ##
-Convert right-side number into appropriate binary representation Single precision allows 23 bits for the mantissa. As such, there is a finite set of numbers able to be represented. If a number cannot be accurately represented in 23 bits, this implementation (as of this phase) will truncate the rest of the digits and leave the remaining bits for the sign and exponent

## Phase 3 (complete) ##
-Shift appropriate bits into the right-side register This implementation will place the bits currently representing the right-of-decimal number at the left side of the register and move one bit at a time from the left-side into it, while keeping a counter to aid in calculating the final exponent

## Phase 4 (complete) ##
Calculate correct exponent and shift into the appropriate register.

## Phase 5 (complete) ##
Appropriate assign bit and shift into the register.

## Phase 6 (complete) ##
implement conversion of numbers less then one.
-phase 6 complete as of 3/16/13

## Phase 7 (complete) ##
-Present findings to the panel and class
> -Should include flow-chart and discussion of overview of algorithms included, as well as detailed information and demo of functional code.

## Group Meetings ##

| **Meeting Dates** | **Place** |
|:------------------|:----------|
| 2/5/13            | Lab       |
| 2/12/13           | Lab       |
| 2/19/13           | Lab       |
| 2/26/13           | Lab       |
| 3/5/13            | Lab       |
| 3/7/13            | Skype Meeting |
| 3/8/13            | Skype Meeting |
| 3/9/13            | Skype Meeting |
| 3/15/13           | Skype Meeting |
| 3/17/13           | Skype Meeting |
| 3/18/13           | Skype Meeting |
| 3/19/13           |           |