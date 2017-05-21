# Purpose
Practice finding a path to a goal.  

# References

# Results

## Background

### original problem statement
A Turtle is placed on the top left corner of a m by n grid.  
The turtle can only move right or move down by one cell at a time.  
Implement the method that computes the total number of unique paths that the turtle can take to reach the bottom right corner.

The entire board is clear, no obstacles.

###
I said could solve by recursion or by mathematical calculation.

### Approach 1: mathematical calculation
Each path makes m - 1 moves right plus n -1 moves down.  
First move has 2 choices- right or down.  
Could represent each path as a (m-1)+(n-1) digit binary number where left is 0 and down is 1.  
At first I thought at each step there were 2 possible moves, so total number of unique paths is

    2**((m-1)+(n-1))

But person who posed the problem said this is too large.  
Then I realized that for some positions, there is only 1 possible move.  
For example on bottom row can only move right.  

Problem provider said the problem can be solved as a combination of moves C.  

    C(m-1, m+n-2) = (m+n-2) * (m+n-3) * (m+n-4).... * ((m+n-2) - (m-1) +1) / (m-1)!

But they asked me to solve it more programmatically without an equation.

### Approach 2: recursion

See tests.
