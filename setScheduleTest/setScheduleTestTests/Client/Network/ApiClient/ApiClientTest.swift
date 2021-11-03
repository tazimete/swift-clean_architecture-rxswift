//
//  MockApiClient.swift
//  setScheduleTestTests
//
//  Created by JMC on 2/11/21.
//

import Foundation
import XCTest
@testable import setScheduleTest
import RxSwift

class ApiClientTest: XCTestCase {
    private var apiClient: AbstractApiClient!
    private var disposeBag: DisposeBag!

    override func setUp() {
        apiClient = APIClient.shared
        disposeBag = DisposeBag() 
    }
    
    override func tearDown() {
        apiClient = nil
        disposeBag = nil
    }
    
    func testApiClient() {
        apiClient.send(session: MockURLSession(), apiRequest: SearchApiRequest.searchMovie(params: MoviewSearchParams(query: "the", year: 2000)), type: SearchApiRequest.ResponseType.self).subscribe(onNext: {
            response in
            
            XCTAssertEqual(response.results?.count ?? 0, 10)
            XCTAssertNotNil(response)
            XCTAssertNotNil(response.results)
            XCTAssertEqual(response.results?[0].id ?? 0, 630004)
            XCTAssertEqual(response.results?[1].title ?? "", "The Protégé")
            XCTAssertNotEqual(response.results?[2].voteCount ?? 0, 100)
            XCTAssertNotEqual(response.results?[3].voteCount ?? 0, 5)
            
        }).disposed(by: disposeBag)
    }
    
    func testApiClientPerformance() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            apiClient.send(session: MockURLSession(), apiRequest: SearchApiRequest.searchMovie(params: MoviewSearchParams(query: "the", year: 2000)), type: SearchApiRequest.ResponseType.self).subscribe(onNext: {
                response in
                
                XCTAssertEqual(response.results?.count ?? 0, 10)
                XCTAssertNotNil(response)
                XCTAssertNotNil(response.results)
            }).disposed(by: disposeBag)
        }
    }
}

