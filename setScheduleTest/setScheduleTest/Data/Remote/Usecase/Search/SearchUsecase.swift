//
//  SearchUsecase.swift
//  setScheduleTest
//
//  Created by JMC on 30/10/21.
//

import Foundation

public class SearchUsecase: AbstractSearchUsecase {
    public var repository: AbstractRepository
    
    public init() {
        repository = SearchRepository()
    }
}
