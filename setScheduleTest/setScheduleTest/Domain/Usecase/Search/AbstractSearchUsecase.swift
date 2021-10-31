//
//  AbstractSearchUsecase.swift
//  setScheduleTest
//
//  Created by JMC on 30/10/21.
//

import Foundation
import RxSwift

protocol AbstractSearchUsecase: AbstractUsecase {
    func search(query: String, year: Int) -> Observable<SearchApiRequest.ResponseType>
}
