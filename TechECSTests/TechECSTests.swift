//
//  TechECSTests.swift
//  TechECSTests
//
//

import XCTest
@testable import TechECS

class TechECSTests: XCTestCase {

    override class func setUp() {

    }
    func testApiCall() {
        let nyvVc = NYCViewController()
//        XCTAssertFalse(((nyvVc.presenter?.view?.showError("False")) != nil))
        XCTAssertTrue(((nyvVc.presenter?.view?.success("True")) != nil))
//        XCTAssertTrue(nyvVc.presenter?.interactor?.presenter?.didSucces(with: ""))
    }
}
