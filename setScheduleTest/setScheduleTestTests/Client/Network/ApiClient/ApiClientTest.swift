//
//  MockApiClient.swift
//  setScheduleTestTests
//
//  Created by JMC on 2/11/21.
//

import XCTest
@testable import setScheduleTest
import RxSwift

class ApiClientTest: XCTestCase {
    private var apiClient: AbstractApiClient!
    private var disposeBag: DisposeBag!

    override func setUp() {
        apiClient = APIClient(session: MockURLSession(configuration: URLSessionConfigHolder.config))
        disposeBag = DisposeBag() 
    }
    
    override func tearDown() {
        apiClient = nil
        disposeBag = nil
    }
    
    func testApiClient() {
        let request = SearchApiRequest.searchMovie(params: MoviewSearchParams(query: "the", year: 2000))
        let expectation = self.expectation(description: "Wait for \(request.path) to load.")
        var result: SearchResponse<Movie>!
        var networkError: NetworkError?
        
        apiClient.send(apiRequest: request, type: SearchApiRequest.ResponseType.self)
            .subscribe(onNext: { [weak self] response in
                result = response
                expectation.fulfill()
            }, onError: { [weak self] error in
                networkError = error as! NetworkError
                expectation.fulfill()
            }).disposed(by: disposeBag)
        
        waitForExpectations(timeout: 5, handler: nil)
        
        //asserts
        XCTAssertEqual(result.results?.count ?? 0, 10)
        XCTAssertNotNil(result)
        XCTAssertNotNil(result.results)
        XCTAssertEqual(result.results?[0].id ?? 0, 630004)
        XCTAssertEqual(result.results?[1].title ?? "", "The Protégé")
        XCTAssertNotEqual(result.results?[2].voteCount ?? 0, 100)
        XCTAssertNotEqual(result.results?[3].voteCount ?? 0, 5)
        XCTAssertNil(networkError)
    }
    
    func testApiClientPerformance() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            let request = SearchApiRequest.searchMovie(params: MoviewSearchParams(query: "the", year: 2000))
            let expectation = self.expectation(description: "Wait for \(request.path) to load.")
            var result: SearchResponse<Movie>!
            var networkError: NetworkError?
            
            apiClient.send(apiRequest: request, type: SearchApiRequest.ResponseType.self)
                .subscribe(onNext: { [weak self] response in
                    result = response
                    expectation.fulfill()
                
                }, onError: { [weak self] error in
                    networkError = error as! NetworkError
                    expectation.fulfill()
                }).disposed(by: disposeBag)
            
            waitForExpectations(timeout: 5, handler: nil)
            
            //asserts
            XCTAssertEqual(result.results?.count ?? 0, 10)
            XCTAssertNotNil(result)
            XCTAssertNotNil(result.results)
            XCTAssertEqual(result.results?[0].id ?? 0, 630004)
            XCTAssertEqual(result.results?[1].title ?? "", "The Protégé")
            XCTAssertNotEqual(result.results?[2].voteCount ?? 0, 100)
            XCTAssertNotEqual(result.results?[3].voteCount ?? 0, 5)
            XCTAssertNil(networkError)
        }
    }
}

