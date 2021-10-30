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
    func searchData() -> Observable<GithubApiRequest.ResponseType>
}

public class SearchViewModel: AbstarctSearchViewModel {
    
    public init() {
        usecase = SearchUsecase()
    }
    
    struct SearchInput {
        let searchItemListTrigger: Observable<Void>
    }
    
    struct SearchOutput {
        let searchItems: BehaviorRelay<GithubApiRequest.ResponseType>
    }
    
    public var usecase: AbstractUsecase
    
    func getSearchOutput(input: SearchInput) -> SearchOutput {
        let searchListResponse = BehaviorRelay<GithubApiRequest.ResponseType>(value: GithubApiRequest.ResponseType([]))

        input.searchItemListTrigger.flatMapLatest({ () -> Observable<GithubApiRequest.ResponseType> in
            self.searchData()
        }).subscribe(onNext: {
            response in
            
            searchListResponse.accept(response)
        }, onError: nil, onCompleted: nil, onDisposed: nil)
        
        return SearchOutput.init(searchItems: searchListResponse)
    }
    
    public func searchData() -> Observable<GithubApiRequest.ResponseType> {
        return (usecase as! AbstractSearchUsecase).search()
    }
}
