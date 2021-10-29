//
//  SerachViewModel.swift
//  setScheduleTest
//
//  Created by JMC on 30/10/21.
//

import Foundation
import RxSwift

public protocol AbstarctSearchViewModel: AbstractViewModel {
    func searchData() -> Observable<GithubApiRequest.ResponseType>
}

public class SearchViewModel: AbstarctSearchViewModel {
    public var usecase: AbstractUsecase
    
    public init() {
        usecase = SearchUsecase()
    }
    
    public struct Input {
        
    }
    
    public struct Output {
        
    }
    
    public func getSearchOutput() -> Output {
        return Output()
    }
    
    public func searchData() -> Observable<GithubApiRequest.ResponseType> {
        return (usecase as! AbstractSearchUsecase).search()
    }
}
