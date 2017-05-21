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

        // base case
        if (rows == 1 && columns == 1) {
            // we got to bottom corner, finished a path
            return 1
        }

        if rows == 1 {
            // can't move down, move right
            return numberOfUniquePaths(rows: rows, columns: columns - 1)
        }

        if columns == 1 {
            // can't move right, move down
            return numberOfUniquePaths(rows: rows - 1, columns: columns)
        }

        return numberOfUniquePaths(rows: rows - 1, columns: columns)
            + numberOfUniquePaths(rows: rows, columns: columns - 1)
    }


}

