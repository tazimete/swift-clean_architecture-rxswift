//
//  SearchUsecase.swift
//  setScheduleTest
//
//  Created by JMC on 30/10/21.
//

import Foundation
import RxSwift

public class SearchUsecase: AbstractSearchUsecase {
    public var repository: AbstractRepository
    
    public init() {
        repository = SearchRepository()
    }
    
    public func search() -> Observable<GithubApiRequest.ResponseType> {
        return (repository as! AbstractSearchRepository).get()
    }
}
