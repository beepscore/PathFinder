//
//  PathFinder.swift
//  PathFinder
//
//  Created by Steve Baker on 5/21/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

import Foundation

class PathFinder: NSObject {

    class func numberOfUniquePaths(rows: Int, columns: Int) -> Int {

        if (rows <= 0 || columns <= 0) {
            // degenerate case, can't move
            return 0
        }

        if (rows == 1 && columns == 1) {
            // already at bottom corner goal, can't move
            return 0
        }

        // base case
        if (rows == 2 && columns == 1) || (rows == 1 && columns == 2) {
            // next move must reach bottom corner goal and complete a path
            return 1
        }

        if rows == 1 {
            // can't move down, move right
            // recurse by calling on board with 1 less column
            return numberOfUniquePaths(rows: rows, columns: columns - 1)
        }

        if columns == 1 {
            // can't move right, move down
            // recurse by calling on board with 1 less row
            return numberOfUniquePaths(rows: rows - 1, columns: columns)
        }

        // can move right, also can move down
        return numberOfUniquePaths(rows: rows - 1, columns: columns)
            + numberOfUniquePaths(rows: rows, columns: columns - 1)
    }


}

