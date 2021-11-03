//
//  setScheduleTestTests.swift
//  setScheduleTestTests
//
//  Created by JMC on 29/10/21.
//

import XCTest
@testable import setScheduleTest
import RxSwift

class setScheduleTestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testApiCLient() {
        APIClient.shared.send(session: MockURLSession(), apiRequest: SearchApiRequest.searchMovie(params: MoviewSearchParams(query: "the", year: 2000)), type: SearchApiRequest.ResponseType.self).subscribe(onNext: {
            response in
            
            print("Stubb Response = \(response)")
        }).disposed(by: DisposeBag())
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
