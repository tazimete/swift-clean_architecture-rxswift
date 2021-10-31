//
//  SearchViewModel.swift
//  setScheduleTest
//
//  Created by JMC on 31/10/21.
//

import RxSwift


public protocol AbstarctSearchViewModel: AbstractViewModel {
    func getSearchOutput(input: SearchViewModel.SearchInput) -> SearchViewModel.SearchOutput
    func searchData() -> Observable<SearchApiRequest.ResponseType>
}
