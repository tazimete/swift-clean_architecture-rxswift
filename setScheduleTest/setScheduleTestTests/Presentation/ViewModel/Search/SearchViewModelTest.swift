//
//  SearchViewModelTest.swift
//  setScheduleTestTests
//
//  Created by JMC on 3/11/21.
//

import XCTest
@testable import setScheduleTest
import RxSwift

class SearchViewModelTest: XCTestCase {
    private var disposeBag: DisposeBag!
    private var searchViewModel: AbstractSearchViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        disposeBag = DisposeBag()
        searchViewModel = SearchViewModel(usecase: MockSearchUsecase(repository: MockSearchRepository()))
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        disposeBag = nil
        searchViewModel = nil
    }

    func testUsecase() {
        XCTAssertNotNil(searchViewModel.usecase)
        XCTAssertNotNil(searchViewModel.usecase.repository)
        XCTAssertNotNil(searchViewModel.usecase.repository.apiClient)
    }
    
    func testSearchMovies() {
        let expectation = self.expectation(description: "Wait for search usecase to load.")
        var result: [Movie]!
        var networkError: NetworkError?
        
        let searchInput = SearchViewModel.SearchInput(searchItemListTrigger: Observable.just(SearchViewModel.SearchInputModel(query: "the", year: 2000)))
        let searchOutput = searchViewModel.getSearchOutput(input: searchInput)
        
        //populate table view
        searchOutput.searchItems.subscribe(onNext: { [weak self] response in
            result = response
            expectation.fulfill()
        }, onError: { [weak self] error in
            networkError = error as! NetworkError
            expectation.fulfill()
        }).disposed(by: disposeBag)
        
        // detect error
        searchOutput.errorTracker.subscribe(onNext: {
            [weak self] error in
            
            guard let weakSelf = self, let error = error else {
                return
            }
            
            expectation.fulfill()
        }).disposed(by: disposeBag)
        
        waitForExpectations(timeout: 5, handler: nil)
        
        //asserts
        XCTAssertEqual(result.count, 10)
        XCTAssertNotNil(result)
        XCTAssertEqual(result[0].id, 630004)
        XCTAssertEqual(result[1].title, "The Protégé")
        XCTAssertNotEqual(result[2].voteCount, 100)
        XCTAssertNotEqual(result[3].voteCount, 5)
        XCTAssertNil(networkError)
    }
}
