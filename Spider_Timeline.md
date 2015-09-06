# Timeline #


# Home #
[Team Spider Home](Team_Spider.md)

# Version 1.0 Conversion #
Updated March 14, 2013
  * Team began initial planning for how the code would work:
    1. Format
    1. Functions needed
    1. Implementation
  * To Do:
    1. Start actually coding material

## Version 1.1 Conversion ##
Updated March 19, 2013
  * Coding is progressing well:
    1. Read in most values
    1. Conversion from decimal to binary 32

  * To Do:
    1. Full range representation
    1. Values with a leading 0 (0.75) would cause errors

  * Presentation Work:
    1. Update Flow Charts
    1. Update Presentation


## Version 1.2 Conversion ##
Updated March 21, 2013
  * Code successfully performs required material:


# Version 1.0 Addition and Subtraction #
**Addition and Subtraction Operations are in a Different Code**

Updated March 28, 2013
  * Team began initial planning for how the code would handle Operations:
    1. Addition
    1. Subtraction
  * To Do:
    1. Addition
    1. Subtraction

## Version 1.1 Addition and Subtraction ##
Updated April 2, 2013
  * Working:
    1. Addition
    1. Subtraction

## Version 1.0 Multiplication ##
**Multiplication Operation is in a Different Code**

Updated April 4, 2013
  * Coding is progressing well
    1. Multiplication
  * To Do:
    1. Multiplication
  * Working:

## Version 1.1 Multiplication ##
Updated April 11, 2013
  * Code successfully performs the following operations:
    1. Multiply
  * To Do:
    1. Full range representation
    1. Exception handling for operations
    1. Algorithm flowcharts
    1. Update Presentation


# Modifications #
Updated April 18, 2013
  * Team began initial planning for how the codes would handle Exceptions:
    1. Zero
    1. Overflow
    1. Underflow
    1. NAN
    1. Invalid Operations
    1. Inexact
    1. Infinity
  * To Do:
    * Exceptions
  * Team is also improving part 1:
    * Rounding

## Modification 1 ##
Updated April 23, 2013

Updates to Code 1:
  * Implements Arrays
  * Implements Multiple Files

## Modification 2 ##
Updated April 24, 2013

Updates to Exception Handling:
  * Invalid Operation
    * Partially Implemented
    * Can Occur from:
      * Multiplying infinity by zero
      * Adding opposite signed infinities
      * Subtracting same signed infinities
      * Addition or subtraction of a finite value and infinite value
  * Overflow
    * Partially Implemented
    * Also signals Inexact exception
  * Underflow
    * Partially Implemented
    * Returns a denormalized value
    * Also signals Inexact exception
  * Inexact
    * Partially Implemented
    * Triggers whenever a value become inaccurate due to operations being done on it
  * Division by Zero
    * Does not need to be Implemented
    * Self Explanatory
    * Would be needed/implemented if division was also needed.