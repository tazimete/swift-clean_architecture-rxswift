//
//  SerachViewModel.swift
//  setScheduleTest
//
//  Created by JMC on 30/10/21.
//

import Foundation
import RxSwift
import RxCocoa

class SearchViewModel: AbstractSearchViewModel {
    public struct SearchInputModel {
        let query: String
        let year: Int
    }
    
    public struct SearchInput {
        let searchItemListTrigger: Observable<Void>
    }
    
    public struct SearchOutput {
        let searchItems: BehaviorRelay<[SearchApiRequest.ItemType]>
        let errorTracker: BehaviorRelay<NetworkError?>
    }
    
    public var inputModel: SearchInputModel?
    public var usecase: AbstractUsecase
    
    public init() {
        usecase = SearchUsecase()
    }
    
    public func getSearchOutput(input: SearchInput) -> SearchOutput {
        let searchListResponse = BehaviorRelay<[SearchApiRequest.ItemType]>(value: [])
        let errorResponse = BehaviorRelay<NetworkError?>(value: nil)
        
        input.searchItemListTrigger.flatMapLatest({ [weak self] () -> Observable<SearchApiRequest.ResponseType> in
            guard let weakSelf = self else {
                return Observable.just(SearchApiRequest.ResponseType())
            }
            
            //show shimmer
            searchListResponse.accept(Array<SearchApiRequest.ItemType>(repeating: SearchApiRequest.ItemType(), count: 9))
            
            //fetch movie list
            return weakSelf.searchData(query: weakSelf.inputModel?.query ?? "", year: weakSelf.inputModel?.year ?? 0)
        }).subscribe(onNext: {
            response in
            
            searchListResponse.accept(response.results ?? [])
        }, onError: { [weak self] error in
            errorResponse.accept(error as? NetworkError)
        }, onCompleted: nil, onDisposed: nil)
        
        return SearchOutput.init(searchItems: searchListResponse, errorTracker: errorResponse)
    }
    
    public func searchData(query: String, year: Int) -> Observable<SearchApiRequest.ResponseType> {
        return (usecase as! AbstractSearchUsecase).search(query: query, year: year)
    }
}
