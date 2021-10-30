//
//  SerachViewModel.swift
//  setScheduleTest
//
//  Created by JMC on 30/10/21.
//

import Foundation
import RxSwift
import RxCocoa

public protocol AbstarctSearchViewModel: AbstractViewModel {
    func getSearchOutput(input: SearchViewModel.SearchInput) -> SearchViewModel.SearchOutput
    func searchData() -> Observable<SearchApiRequest.ResponseType>
}

public class SearchViewModel: AbstarctSearchViewModel {
    
    public init() {
        usecase = SearchUsecase()
    }
    
    public struct SearchInput {
        let searchItemListTrigger: Observable<Void>
    }
    
    public struct SearchOutput {
        let searchItems: BehaviorRelay<[SearchApiRequest.ItemType]>
    }
    
    public var usecase: AbstractUsecase
    
    public func getSearchOutput(input: SearchInput) -> SearchOutput {
        let searchListResponse = BehaviorRelay<[SearchApiRequest.ItemType]>(value: [])

        input.searchItemListTrigger.flatMapLatest({ () -> Observable<SearchApiRequest.ResponseType> in
            self.searchData()
        }).subscribe(onNext: {
            response in
            
            searchListResponse.accept(response.results ?? [])
        }, onError: nil, onCompleted: nil, onDisposed: nil)
        
        return SearchOutput.init(searchItems: searchListResponse)
    }
    
    public func searchData() -> Observable<SearchApiRequest.ResponseType> {
        return (usecase as! AbstractSearchUsecase).search()
    }
}
