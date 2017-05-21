//
//  PathFinder.swift
//  PathFinder
//
//  Created by Steve Baker on 5/21/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

import Foundation

class PathFinder: NSObject {

/*

 A Turtle is placed on the top left corner of a m by n grid. The turtle can only move right or move down by one cell at a time. Implement the method that computes the total number of unique paths that the turtle can take to reach the bottom right corner.

 */

    // entire board is clear, no obstacles
    

// m + n - 2 moves
// m - 1 moves horizontally, n -1 moves vertically
// C(m-1, m+n-2) = (m+n-2) * (m+n-3) * (m+n-4).... * ((m+n-2) - (m-1) +1) / (m-1)!

//  struct Position(row:Int, column:Int) {
//    self.row = row
//    self.column = column
//  }

    class func numberOfUniquePaths(rows: Int, columns: Int) -> Int {

        // first move has 2 choices- right or down
        // each path takes m-1 steps left plus n-1 steps down

        // could represent each path as a (m-1)+(n-1) digit binary number
        // where left is 0 and down is 1
        // uniquePaths = []
        // 10

        // base case
        if (rows == 1 && columns == 1) {
            // we got to bottom corner, finished a path
            return 1
        }

        if rows < 2 {
            // can't move down, move right
            return numberOfUniquePaths(rows: rows, columns: columns - 1)
        }

        // moveRightIfPossible
        if columns < 2 {
            // can't move right, move down
            return numberOfUniquePaths(rows: rows - 1, columns: columns)
        }

        return numberOfUniquePaths(rows: rows - 1, columns: columns)
            + numberOfUniquePaths(rows: rows, columns: columns - 1)
    }


}

