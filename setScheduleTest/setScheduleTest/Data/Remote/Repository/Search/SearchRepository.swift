//
//  SearchRepository.swift
//  setScheduleTest
//
//  Created by JMC on 30/10/21.
//

import Foundation
import RxSwift

public class SearchRepository: AbstractSearchRepository {
    public var apiClient: AbstractApiClient
    
    public init() {
        apiClient = APIClient.shared
    }
    
    public func get() -> Observable<SearchApiRequest.ResponseType> {
        return apiClient.send(apiRequest: SearchApiRequest.searchMovie(params: MoviewSearchParams(query: "the", year: 2000)), type: SearchApiRequest.ResponseType.self)
    }
}
