//
//  SearchRepositoryTest.swift
//  setScheduleTestTests
//
//  Created by JMC on 3/11/21.
//

import XCTest
@testable import setScheduleTest
import RxSwift

class SearchRepositoryTest: XCTestCase {
    private var disposeBag: DisposeBag!
    private var searchRepository: SearchRepository!
    private var apiClient: MockApiClient!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        disposeBag = DisposeBag()
        apiClient = MockApiClient.shared
        searchRepository = SearchRepository(apiClient: apiClient)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        apiClient = nil
        searchRepository = nil
        disposeBag = nil 
    }

    func testGetMovies() {
        searchRepository.get(query: "the", year: 2000)
            .subscribe(onNext: {
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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
