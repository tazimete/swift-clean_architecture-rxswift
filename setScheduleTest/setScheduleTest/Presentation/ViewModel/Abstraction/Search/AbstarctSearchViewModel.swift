//
//  SearchViewModel.swift
//  setScheduleTest
//
//  Created by JMC on 31/10/21.
//


import Foundation
import RxSwift

protocol AbstractSearchViewModel: AbstractViewModel {
    var inputModel: SearchViewModel.SearchInputModel? {get set}
    func getSearchOutput(input: SearchViewModel.SearchInput) -> SearchViewModel.SearchOutput
    func searchData(query: String, year: Int) -> Observable<SearchApiRequest.ResponseType>
}
