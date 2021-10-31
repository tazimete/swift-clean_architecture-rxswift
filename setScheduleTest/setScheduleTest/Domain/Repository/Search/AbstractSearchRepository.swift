//
//  AbstractSearchRepository.swift
//  setScheduleTest
//
//  Created by JMC on 30/10/21.
//

import Foundation
import RxSwift

protocol AbstractSearchRepository: AbstractRepository {
     func get(query: String, year: Int) -> Observable<SearchApiRequest.ResponseType>
}
