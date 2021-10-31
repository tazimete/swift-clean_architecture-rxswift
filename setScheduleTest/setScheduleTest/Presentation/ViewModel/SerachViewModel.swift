//
//  SerachViewModel.swift
//  setScheduleTest
//
//  Created by JMC on 30/10/21.
//

import Foundation
import RxSwift
import RxCocoa

public class SearchViewModel: AbstarctSearchViewModel {
    
    public init() {
        usecase = SearchUsecase()
    }
    
    public struct SearchInput {
        let searchItemListTrigger: Observable<Void>
    }
    
    public struct SearchOutput {
        let searchItems: BehaviorRelay<[SearchApiRequest.ItemType]>
        let errorTracker: BehaviorRelay<NetworkError?>
    }
    
    public var usecase: AbstractUsecase
    
    public func getSearchOutput(input: SearchInput) -> SearchOutput {
        let searchListResponse = BehaviorRelay<[SearchApiRequest.ItemType]>(value: [])
        let errorResponse = BehaviorRelay<NetworkError?>(value: nil)

        input.searchItemListTrigger.flatMapLatest({ [weak self] () -> Observable<SearchApiRequest.ResponseType> in
            guard let weakSelf = self else {
                return Observable.just(SearchApiRequest.ResponseType())
            }
            
            return weakSelf.searchData()
        }).subscribe(onNext: {
            response in
            
            searchListResponse.accept(response.results ?? [])
        }, onError: { [weak self] error in
            errorResponse.accept(error as? NetworkError)
        }, onCompleted: nil, onDisposed: nil)
        
        return SearchOutput.init(searchItems: searchListResponse, errorTracker: errorResponse)
    }
    
    public func searchData() -> Observable<SearchApiRequest.ResponseType> {
        return (usecase as! AbstractSearchUsecase).search()
    }
}
