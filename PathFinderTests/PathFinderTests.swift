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

    func testNumberOfUniquePaths2r2c() {
        let numberOfUniquePaths = PathFinder.numberOfUniquePaths(rows:2, columns:2)
        XCTAssertEqual(numberOfUniquePaths, 2)
    }

    func testNumberOfUniquePaths2r3c() {
        let numberOfUniquePaths = PathFinder.numberOfUniquePaths(rows:2, columns:3)
        XCTAssertEqual(numberOfUniquePaths, 3)
    }

    func testNumberOfUniquePaths3r3c() {
        let numberOfUniquePaths = PathFinder.numberOfUniquePaths(rows:3, columns:3)
        XCTAssertEqual(numberOfUniquePaths, 6)
    }

}
