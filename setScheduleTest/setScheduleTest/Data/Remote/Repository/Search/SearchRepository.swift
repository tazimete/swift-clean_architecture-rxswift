//
//  SearchRepository.swift
//  setScheduleTest
//
//  Created by JMC on 30/10/21.
//

import Foundation
import RxSwift

class SearchRepository: AbstractSearchRepository {
    var apiClient: AbstractApiClient
    
    init(apiClient: AbstractApiClient = APIClient.shared) {
        self.apiClient = apiClient
    }
    
    public func get(query: String, year: Int) -> Observable<SearchApiRequest.ResponseType> {
        return apiClient.send(apiRequest: SearchApiRequest.searchMovie(params: MoviewSearchParams(query: query, year: year)), type: SearchApiRequest.ResponseType.self)
    }
}
