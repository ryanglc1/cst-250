


**_Last Update_** : 4/4/2013

# Notes #
## Useful Material ##
  1. The decimal (.) is represented as 0x0000002E in Hex.
  1. The Negative sign (-) is represented as 0x0000002D in Hex.
  1. Since we are only using 0 - 9 in ASCII to convert floating point, we will only being using hex 0x00000030 through 0x00000039
  1. Code will require a decimal point at this time to convert a number
  1. qNaN starts at 0x7FC00000



## Testing ##
Successfully tested the number 26.125. Hex value that should be stored was 0x41D10000, and the final register successfully stored the proper Hex value. - Success (Feb 28th, 2013)

Added the negative function to check for a negative symbol. Tested -26.125, which has a Hex value of 0xC1D10000. Final register displayed the proper Hex value. -Success (Feb 28th, 2013)

Tested a number all the way up to 3 billion (3000000000.0) and was converted to the proper Hex Value. - Success (Feb 28th, 2013)

Found the limit to be + or - 2<sup>32</sup>. (Feb 28th, 2013)

Cannot store any numbers between -1 and 1 currently. (March 7th, 2013)

Most numbers between -1 and 1 are working, though we may need more registers to represent long decimal numbers (March 28th, 2013)

Finished the Add operation implementation (March 28th, 2013)