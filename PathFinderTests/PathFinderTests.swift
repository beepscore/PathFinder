//
//  PathFinderTests.swift
//  PathFinderTests
//
//  Created by Steve Baker on 5/21/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

import XCTest
@testable import PathFinder

class PathFinderTests: XCTestCase {

    func testNumberOfUniquePaths() {

        var rows = 2
        var columns = 2
        var numberOfUniquePaths = PathFinder.numberOfUniquePaths(rows:rows, columns:columns)
        XCTAssertEqual(numberOfUniquePaths, 2)

        rows = 2
        columns = 3
        numberOfUniquePaths = PathFinder.numberOfUniquePaths(rows:rows, columns:columns)
        XCTAssertEqual(numberOfUniquePaths, 3)

        rows = 3
        columns = 3
        numberOfUniquePaths = PathFinder.numberOfUniquePaths(rows:rows, columns:columns)
        XCTAssertEqual(numberOfUniquePaths, 6)
    }
    
}
