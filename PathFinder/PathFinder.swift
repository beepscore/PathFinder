//
//  PathFinder.swift
//  PathFinder
//
//  Created by Steve Baker on 5/21/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

import Foundation

class PathFinder: NSObject {

    /// Given rows and columns integers, returns key string e.g. 3, 12 returns "3,12"
    /// This method may be used to construct a key to memoize results in a dictionary
    ///
    /// - Parameters:
    ///   - rows: rows
    ///   - columns: columns
    /// - Returns: string with rows and columns separated by "," e.g. "3,12"
    class func key(rows: Int, columns: Int) -> String {
        let separator = ","
        return String(rows) + separator + String(columns)
    }

    /// Given a matrix of rows and columns, returns number of unique paths from origin 0,0 to rows, columns
    ///
    /// - Parameters:
    ///   - rows: rows
    ///   - columns: columns
    /// - Returns: number of unique paths from origin 0,0 to rows, columns
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

    /// Given a matrix of rows and columns, returns number of unique paths from origin 0,0 to rows, columns
    ///
    /// - Parameters:
    ///   - rows: rows
    ///   - columns: columns
    ///   - memoized: dictionary of previous results. inout so method can add new key/value pair
    /// - Returns: number of unique paths from origin 0,0 to rows, columns
    /// Given rows and columns integers, returns key string e.g. 3, 12 returns "3,12"
    class func numberOfUniquePathsMemoized(rows: Int, columns: Int, memoized: inout [String: Int]) -> Int {

        let key = PathFinder.key(rows: rows, columns: columns)

        if let memoizedResult = memoized[key] {
            // we have a memoized result. Don't need to recurse.
            return memoizedResult
        }

        if (rows <= 0 || columns <= 0) {
            // degenerate case, can't move
            let result = 0
            memoized[key] = result
            return result
        }

        if (rows == 1 && columns == 1) {
            // already at bottom corner goal, can't move
            let result = 0
            memoized[key] = result
            return result
        }

        // base case
        if (rows == 2 && columns == 1) || (rows == 1 && columns == 2) {
            // next move must reach bottom corner goal and complete a path
            let result = 1
            memoized[key] = result
            return result
        }

        if rows == 1 {
            // can't move down, move right
            // recurse by calling on board with 1 less column
            let result = numberOfUniquePathsMemoized(rows: rows, columns: columns - 1, memoized: &memoized)
            memoized[key] = result
            return result
        }

        if columns == 1 {
            // can't move right, move down
            // recurse by calling on board with 1 less row
            let result = numberOfUniquePathsMemoized(rows: rows - 1, columns: columns, memoized: &memoized)
            memoized[key] = result
            return result
        }

        // can move right, also can move down
        let resultDown = numberOfUniquePathsMemoized(rows: rows - 1, columns: columns, memoized: &memoized)
        let resultRight = numberOfUniquePathsMemoized(rows: rows, columns: columns - 1, memoized: &memoized)
        memoized[key] = resultDown + resultRight
        return resultDown + resultRight
    }

}
