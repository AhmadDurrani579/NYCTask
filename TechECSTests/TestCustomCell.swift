//
//  TestCustomCell.swift
//  TechECSTests
//
//

import XCTest
@testable import NYCTimeTask

class TestCustomCell: XCTestCase {
    var testTable = UITableView()

    override func setUp() {
        testTable.register(NYCArticleCell.self, forCellReuseIdentifier: "NYCArticleCell")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testCustomCell() {
        let customCell: NYCArticleCell = testTable.dequeueReusableCell(withIdentifier: "NYCArticleCell") as! NYCArticleCell
        XCTAssertNotNil(customCell, "No Custom Cell Available")
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
