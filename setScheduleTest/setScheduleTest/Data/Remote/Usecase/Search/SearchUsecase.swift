//
//  SearchUsecase.swift
//  setScheduleTest
//
//  Created by JMC on 30/10/21.
//

import Foundation
import RxSwift

class SearchUsecase: AbstractSearchUsecase {
    var repository: AbstractRepository
    
    public init(repository: AbstractSearchRepository) {
        self.repository = repository
    }
    
    public func search(query: String, year: Int) -> Observable<SearchApiRequest.ResponseType> {
        return (repository as! AbstractSearchRepository).get(query: query, year: year)
    }
}
