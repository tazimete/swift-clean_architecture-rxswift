//
//  SearchRepository.swift
//  setScheduleTest
//
//  Created by JMC on 30/10/21.
//

import Foundation


public class SearchRepository: AbstractSearchRepository {
    public var apiClient: AbstractApiClient
    
    public init() {
        apiClient = APIClient.shared
    }
    
    
}
