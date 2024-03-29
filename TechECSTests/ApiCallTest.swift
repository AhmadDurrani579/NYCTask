//
//  ApiCallTest.swift
//  NYCTimeTaskTests
//
//

import XCTest
@testable import NYCTimeTask
class ApiCallTest: XCTestCase {
   
    var sut: URLSession!
    let networkMonitor = NetworkMonitor.shared

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = URLSession(configuration: .default)

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
      sut = nil
      try super.tearDownWithError()
    }
    
    func testValidApiCallGetsHTTPStatusCode200() throws {
      try XCTSkipUnless(
        networkMonitor.isReachable,
        "Network connectivity needed for this test.")

      // given
      let urlString = "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=election&api-key=PANwDyQltdbj1Rogs7l3TTZxtrx8N8Ky"
      let url = URL(string: urlString)!
      // 1
      let promise = expectation(description: "Status : Ok")

      // when
      let dataTask = sut.dataTask(with: url) { _, response, error in
        // then
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
            // 2
            promise.fulfill()
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
      // 3
      wait(for: [promise], timeout: 5)
    }

}
