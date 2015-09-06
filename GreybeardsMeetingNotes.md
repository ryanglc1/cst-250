# Introduction #

This page is divided up in to weeks since the assignment began. This page is a branch of our development timeline.  While going from meeting to meeting, we realized in week 10 that we needed a place to take notes of our current spot and train of thought to properly capture and restart the project for the next meeting

# Meeting Notes #
### Week 10 (April 14 - April 19) ###
#### Standard Integer Read ####
PSEUDO CODE

_If the result is bigger than 0x7FFFFF, then keep track of how many more digits are read in another register, but don't change the saved value register.
Once UART is done, then multiply saved value by 10, shift right 3 or 4 and decrement the register that kept track of how many we want over 0x7FFFFF until it equals 0_

#### Overflow/Underflow ####
![http://i.imgur.com/zjMVL4k.jpg](http://i.imgur.com/zjMVL4k.jpg)

#### Inexact ####
![http://i.imgur.com/IdvZxXf.jpg](http://i.imgur.com/IdvZxXf.jpg)