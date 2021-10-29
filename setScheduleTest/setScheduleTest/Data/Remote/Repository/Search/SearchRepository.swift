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
    
    public func get() -> Observable<GithubApiRequest.ResponseType> {
        return apiClient.send(apiRequest: GithubApiRequest.fetchUserList(params: FetchGithubUserParam(since: 0)), type: GithubApiRequest.ResponseType.self)
    }
}
