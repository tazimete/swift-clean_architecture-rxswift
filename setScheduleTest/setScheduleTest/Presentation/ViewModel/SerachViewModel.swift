//
//  SerachViewModel.swift
//  setScheduleTest
//
//  Created by JMC on 30/10/21.
//

import Foundation


public protocol AbstarctSearchViewModel: AbstractViewModel {
    
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
}
