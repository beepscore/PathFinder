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

    func testNumberOfUniquePaths0r0c() {
        let numberOfUniquePaths = PathFinder.numberOfUniquePaths(rows:0, columns:0)
        XCTAssertEqual(numberOfUniquePaths, 0)
    }

    func testNumberOfUniquePaths1r1c() {
        let numberOfUniquePaths = PathFinder.numberOfUniquePaths(rows:1, columns:1)
        XCTAssertEqual(numberOfUniquePaths, 0)
    }

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

    func testNumberOfUniquePaths8r8c() {
        let numberOfUniquePaths = PathFinder.numberOfUniquePaths(rows:8, columns:8)
        XCTAssertEqual(numberOfUniquePaths, 3432)
    }

    // show Int.max on this machine
    func testIntMax() {
        XCTAssertEqual(Int.max, 9223372036854775807)
    }

    func testNumberOfUniquePaths16r16c() {
        let numberOfUniquePaths = PathFinder.numberOfUniquePaths(rows:16, columns:16)
        XCTAssertEqual(numberOfUniquePaths, 155117520)
    }

    // without memoization, this takes roughly 160 seconds to run
//    func testNumberOfUniquePaths18r18c() {
//        let numberOfUniquePaths = PathFinder.numberOfUniquePaths(rows:18, columns:18)
//        XCTAssertEqual(numberOfUniquePaths, 2333606220)
//    }

    // MARK: - testNumberOfUniquePathsMemoized

    func testNumberOfUniquePathsMemoized8r8c() {
        var memoized: [String: Int] = Dictionary()
        let numberOfUniquePaths = PathFinder.numberOfUniquePathsMemoized(rows:8, columns:8, memoized: &memoized)
        XCTAssertEqual(numberOfUniquePaths, 3432)
    }

    // with memoization, this takes roughly 10 seconds to run
    func testNumberOfUniquePathsMemoized18r18c() {
        var memoized: [String: Int] = Dictionary()
        let numberOfUniquePaths = PathFinder.numberOfUniquePathsMemoized(rows:18, columns:18, memoized: &memoized)
        XCTAssertEqual(numberOfUniquePaths, 2333606220)
    }

}
